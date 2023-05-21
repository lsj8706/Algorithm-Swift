//
//  pg_161989.swift
//  programmers
//
//  Created by sejin on 2023/05/21.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/161989
//  덧칠하기

import Foundation

func solve161989() {
    print(solution(8, 4, [2, 3, 6]))
}

fileprivate func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var section = section
    var cur = 0
    var result = 0
    
    while !section.isEmpty && cur < section.last! {
        let first = section.removeFirst()
        if cur < first {
            if first + m - 1 > n {
                cur = n
            } else {
                cur = first + m - 1
            }
            result += 1
        } else {
            continue
        }
    }
    
    return result
}
