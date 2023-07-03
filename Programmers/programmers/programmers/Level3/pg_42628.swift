//
//  pg_42628.swift
//  programmers
//
//  Created by sejin on 2023/07/03.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42628
//  이중우선순위큐

import Foundation

func solve42628() {
//   print(solution(["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]))
    print(solution(["D -1", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"]    ))
}

fileprivate func solution(_ operations:[String]) -> [Int] {
    var result = [Int]()
    var heap = Heap<Int>(sortFunction: { $0 > $1 })
    
    enum HeapSortingMode {
        case max
        case min
        
        var sortFunction: (Int, Int) -> Bool {
            switch self {
            case .max:
                return { $0 > $1 }
            case .min:
                return { $0 < $1 }
            }
        }
    }
    
    var mode: HeapSortingMode = .max
    
    for operation in operations {
        let operationArr = operation.split(separator: " ")
        let command = operationArr[0]
        let num = Int(operationArr[1])!
        
        switch (command, num) {
        case ("I", _):
            heap.insert(node: num)
        case ("D", 1):
            guard !heap.isEmpty else { break }
            if mode == .max {
                heap.remove()
            } else {
                mode = .max
                heap.sortFunction = mode.sortFunction
                heap.reBuildHeap()
                heap.remove()
            }
        case ("D", -1):
            guard !heap.isEmpty else { break }
            if mode == .min {
                heap.remove()
            } else {
                mode = .min
                heap.sortFunction = mode.sortFunction
                heap.reBuildHeap()
                heap.remove()
            }
        default:
            break
        }
    }
    
    if heap.isEmpty {
        return [0, 0]
    }
    
    let num = heap.remove()!
    result.append(num)
    
    if heap.isEmpty {
        return [num, num]
    }
        
    mode = mode == .max ? .min : .max
    
    heap.sortFunction = mode.sortFunction
    heap.reBuildHeap()
    
    result.append(heap.remove()!)
    
    return result.sorted(by: >)
}
