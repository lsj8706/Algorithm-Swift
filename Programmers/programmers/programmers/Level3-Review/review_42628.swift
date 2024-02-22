//
//  review_42628.swift
//  programmers
//
//  Created by sejin on 2/22/24.
//

import Foundation

func review42628() {
  print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
}

fileprivate func solution(_ operations:[String]) -> [Int] {
    var doublePriorityQueue = DoublePriorityQueue2<Int>(sortMode: .max)
    
    for operation in operations {
        let operation = operation.components(separatedBy: " ")
        let order = operation[0]
        let number = Int(operation[1])!
        
        if order == "I" {
            doublePriorityQueue.enqueue(number)
            continue
        }
        
        if number == 1 {
            doublePriorityQueue.dequeueMax()
        } else {
            doublePriorityQueue.dequeueMin()
        }
    }
    
    let maxValue = doublePriorityQueue.dequeueMax() ?? 0
    let minValue = doublePriorityQueue.dequeueMin() ?? 0
    
    return [maxValue, minValue]
}

fileprivate struct DoublePriorityQueue2<T: Comparable> {
    enum HeapSortMode {
        case max
        case min
        
        var sortFunction: (T, T) -> Bool {
            switch self {
            case .max:
                return { $0 > $1 }
            case .min:
                return { $0 < $1 }
            }
        }
        
        mutating func toggle() {
            self = self == .max ? .min : .max
        }
    }
    
    var sortMode: HeapSortMode {
        didSet {
            self.heap.sortFunction = sortMode.sortFunction
            self.heap.rebuild()
        }
    }
    
    var heap: Heap<T>
    
    init(sortMode: HeapSortMode) {
        self.heap = Heap<T>(sortFunction: sortMode.sortFunction)
        self.sortMode = sortMode
    }
    
    mutating
    func enqueue(_ item: T) {
        self.heap.insert(item)
    }
    
    @discardableResult
    mutating func dequeueMax() -> T? {
        if self.sortMode == .max {
            return heap.remove()
        } else {
            self.sortMode.toggle()
            return heap.remove()
        }
    }
    
    @discardableResult
    mutating func dequeueMin() -> T? {
        if self.sortMode == .min {
            return heap.remove()
        } else {
            self.sortMode.toggle()
            return heap.remove()
        }
    }
    
    mutating
    func dequeue() -> T? {
        return self.heap.remove()
    }
}


fileprivate struct Heap<T: Comparable> {
    private var elements: [T] = []
    var sortFunction: (T, T) -> Bool
    
    init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    mutating
    func insert(_ item: T) {
        elements.append(item)
        swimUp(elements.count-1)
    }
    
    mutating
    private func swimUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)
        
        while childIndex > 0 && sortFunction(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        elements[childIndex] = child
    }
    
    @discardableResult
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }

        if elements.count == 1 {
            return elements.removeLast()
        }
        
        let value = elements[0]
        elements[0] = elements.removeLast()
        diveDown(0)
        return value
    }
    
    mutating
    private func diveDown(_ index: Int) {
        diveDown(from: index, until: elements.count)
    }
    
    mutating
    private func diveDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(of: index)
        let rightChildIndex = self.rightChildIndex(of: index)
        
        var temp = index
        
        if leftChildIndex < endIndex && sortFunction(elements[leftChildIndex], elements[temp]) {
            temp = leftChildIndex
        }
        
        if rightChildIndex < endIndex && sortFunction(elements[rightChildIndex], elements[temp]) {
            temp = rightChildIndex
        }
        
        if temp == index { return }
        
        elements.swapAt(temp, index)
        diveDown(from: temp, until: endIndex)
    }
    
    mutating
    func rebuild() {
        guard elements.count > 0 else { return }

        for index in (0...(self.elements.count/2)).reversed() {
            self.diveDown(index)
        }
    }
}
