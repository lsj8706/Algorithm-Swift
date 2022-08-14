//
//  pg_86051.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/14.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/86051
// 없는 숫자 더하기

import Foundation

func solve86051() {
    print(solution([1,2,3,4,6,7,8,0]))
}

fileprivate func solution(_ numbers:[Int]) -> Int {
    var check = Array(repeating: 0, count: 10)
    var ans = 0
    
    for number in numbers {
        check[number] = 1
    }
    
    for i in 1..<check.count {
        if check[i] == 0 {
            ans += i
        }
    }
    return ans
}
