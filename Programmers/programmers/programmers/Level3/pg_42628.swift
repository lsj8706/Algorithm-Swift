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
    var queue = DoublePriorityQueue<Int>(sortMode: .max)
        
    for operation in operations {
        let operationArr = operation.split(separator: " ")
        let command = operationArr[0]
        let num = Int(operationArr[1])!
        
        switch (command, num) {
        case ("I", _):
            queue.enqueue(node: num)
        case ("D", 1):
            guard !queue.isEmpty else { break }
            queue.dequeueMax()
        case ("D", -1):
            guard !queue.isEmpty else { break }
            queue.dequeueMin()
        default:
            break
        }
    }
    
    if queue.isEmpty {
        return [0, 0]
    }
    
    let num = queue.deqeue()!
    result.append(num)
    
    if queue.isEmpty {
        return [num, num]
    }
        
    queue.sortMode.toggle()
    
    result.append(queue.deqeue()!)
    
    return result.sorted(by: >)
}
