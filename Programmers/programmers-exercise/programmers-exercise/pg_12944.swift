//
//  pg_12944.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12944
// 평균 구하기

import Foundation

func solve12944() {
    let result = solution([1,2,3,4])
    print(result)
}

fileprivate func solution(_ arr:[Int]) -> Double {
    let sum = arr.reduce(0, +)
    return Double(sum) / Double(arr.count)
}
