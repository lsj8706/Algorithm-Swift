//
//  pg_12928.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/04.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12928
// 약수의 합

import Foundation

func solve12928() {
    print(solution(12))
}

fileprivate func solution(_ n:Int) -> Int {
    if n == 0 {
        return 0
    }
    
    var res = 0
    
    for i in 1...n {
        if n % i == 0 {
            res += i
        }
    }
    
    return res
}
