//
//  pg_12985.swift
//  programmers
//
//  Created by sejin on 2022/09/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12985
// 예상 대진표

import Foundation

func solve12985() {
    print(solution(8, 4, 7))
}

fileprivate func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    var a = a
    var b = b
    
    while true {
        if a == b {
            break
        }
        
        if a % 2 == 0 {
            a /= 2
        } else {
            a = (a+1) / 2
        }
        
        if b % 2 == 0 {
            b /= 2
        } else {
            b = (b+1) / 2
        }
        
        answer += 1
    }

    return answer
}
