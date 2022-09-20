//
//  pg_42587.swift
//  programmers
//
//  Created by sejin on 2022/09/20.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42587
// 프린터

import Foundation

func solve42587() {
    print(solution([1, 1, 9, 1, 1, 1], 0))
}

fileprivate func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = Array(priorities.enumerated())
    var cnt = 0

    while true {
        let first = queue.removeFirst()
        let isMax = queue.allSatisfy {
            first.1 >= $0.1
        }
        
        if isMax {
            cnt += 1
            if first.0 == location {
                break
            }
        } else {
            queue.append(first)
        }
    }
    
    return cnt
}
