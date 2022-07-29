//
//  pg_12947.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12947
// 하샤드 수

import Foundation

func solve12947() {
    let result = solution(13)
    print(result)
}

fileprivate func solution(_ x:Int) -> Bool {
    var sum = 0
    var origin = x
    while origin > 0 {
        sum += origin % 10
        origin /= 10
    }
    
    return x % sum == 0 ? true : false
}
