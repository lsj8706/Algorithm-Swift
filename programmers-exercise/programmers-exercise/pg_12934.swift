//
//  pg_12934.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/02.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12934
// 정수 제곱근 판별

import Foundation

func solve12934() {
    print(solution(9))
}

fileprivate func solution(_ n:Int64) -> Int64 {
    let sqrtValue = sqrt(Double(n))
    if sqrtValue == round(sqrtValue) {
        return Int64(pow(sqrtValue+1, 2))
    }
    return -1
}
