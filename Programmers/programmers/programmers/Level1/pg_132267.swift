//
//  pg_132267.swift
//  programmers
//
//  Created by sejin on 2023/01/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/132267
// 콜라 문제

import Foundation

func solve132267() {
    print(solution(3, 1, 20))
}

fileprivate func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var result = 0
    var emptyBottleCount = n
    
    while emptyBottleCount >= a {
        let quotient = emptyBottleCount / a
        let newBottleCount = quotient * b
        result += newBottleCount
        
        emptyBottleCount = emptyBottleCount % a + newBottleCount
    }
    
    return result
}
