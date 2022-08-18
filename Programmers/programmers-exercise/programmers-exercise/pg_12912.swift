//
//  pg_12912.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/08.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12912
// 두 정수 사이의 합

import Foundation

func solve12912() {
    print(solution(5, 3))
}

fileprivate func solution(_ a:Int, _ b:Int) -> Int64 {
    var cnt = 0
    let small = a < b ? a : b
    let big = a > b ? a : b
    
    for i in small...big {
        cnt += i
    }
    return Int64(cnt)
}
