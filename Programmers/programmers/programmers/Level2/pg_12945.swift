//
//  pg_12945.swift
//  programmers
//
//  Created by sejin on 2022/08/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12945
// 피보나치 수

import Foundation

func solve12945() {
    print(solution(5))
}

fileprivate func solution(_ n:Int) -> Int {
    
    var fibonacciNum = 0
    
    var i = 0
    var a = 0
    var b = 1
    
    while true {
        if i == n-1 {
            fibonacciNum = b
            break
        }
        let temp = b
        b = (a + b) % 1234567
        a = temp
        i += 1
    }
    
    return fibonacciNum % 1234567
}

fileprivate func fibonacci(_ n: Int) -> Int {
    if n == 0 || n == 1 {
        return n
    }
    
    return fibonacci(n-1) + fibonacci(n-2)
}
