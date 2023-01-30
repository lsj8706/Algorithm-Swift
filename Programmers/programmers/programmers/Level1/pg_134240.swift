//
//  pg_134240.swift
//  programmers
//
//  Created by sejin on 2023/01/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/134240
// 푸드 파이트 대회

import Foundation

func solve134240() {
    print(solution([1, 3, 4, 6]))
}

fileprivate func solution(_ food:[Int]) -> String {
    var leftFood = ""
    
    for (i, numberOfFood) in food.enumerated() {
        if i >= 1 {
            leftFood.append(String(repeating: String(i), count: numberOfFood / 2))
        }
    }
    
    return leftFood + "0" + leftFood.reversed()
}
