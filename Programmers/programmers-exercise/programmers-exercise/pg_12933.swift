//
//  pg_12933.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/02.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12933
// 정수 내림차순으로 배치하기

import Foundation

func solve12933() {
    print(solution(118372))
}

fileprivate func solution(_ n:Int64) -> Int64 {
    var arr = [Int64]()
    var i = n
    while i > 0 {
        arr.append(i%10)
        i /= 10
    }
    arr.sort(by: >)
    var res: Int64 = 0
    for j in arr {
        res = 10*res + j
    }
    
    return res
}
