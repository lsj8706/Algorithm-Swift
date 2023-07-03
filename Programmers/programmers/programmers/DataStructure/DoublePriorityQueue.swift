//
//  DoublePriorityQueue.swift
//  programmers
//
//  Created by sejin on 2023/07/03.
//

import Foundation

public struct DoublePriorityQueue<T: Comparable> {
    public enum HeapSortMode {
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
    
    var heap: Heap<T>
    
    var sortMode: HeapSortMode {
        didSet {
            self.heap.sortFunction = sortMode.sortFunction
            self.heap.reBuildHeap()
        }
    }
    
    var isEmpty: Bool {
        return self.heap.isEmpty
    }
    
    var count: Int {
        return self.heap.count
    }
    
    public init(elements: [T] = [], sortMode: HeapSortMode) {
        self.heap = Heap<T>(elements: elements, sortFunction: sortMode.sortFunction)
        self.sortMode = sortMode
    }
    
    mutating func enqueue(node: T) {
        self.heap.insert(node: node)
    }
    
    @discardableResult
    mutating func dequeueMax() -> T? {
        if self.heap.isEmpty { return nil }
        if self.sortMode == .max {
            return self.heap.remove()
        } else {
            self.sortMode.toggle()
            return self.heap.remove()
        }
    }
    
    @discardableResult
    mutating func dequeueMin() -> T? {
        if self.heap.isEmpty { return nil }
        if self.sortMode == .min {
            return self.heap.remove()
        } else {
            self.sortMode.toggle()
            return self.heap.remove()
        }
    }
    
    @discardableResult
    mutating func deqeue() -> T? {
        return self.heap.remove()
    }
}
