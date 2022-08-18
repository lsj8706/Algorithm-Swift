//
//  pg_87389.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/09.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/87389
// 나머지가 1이 되는 수 찾기

import Foundation

func solve87389() {
    print(solution(10))
}

fileprivate func solution(_ n:Int) -> Int {
    for i in 1...n-1 {
        if n % i == 1 {
            return i
        }
    }
    return n-1
}
