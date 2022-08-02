//
//  pg_12935.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/02.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12935
// 제일 작은 수 제거하기


import Foundation

func solve12935() {
    print(solution([4,3,2,1]))
}

fileprivate func solution(_ arr:[Int]) -> [Int] {
    if arr.count == 1 {
        return [-1]
    }
    let minValue = arr.min()
    let res = arr.filter { $0 != minValue }

    return res
}
