//
//  pg_135808.swift
//  programmers
//
//  Created by sejin on 2023/01/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/135808
// 과일 장수

import Foundation

func solve135808() {
    print(solution(3, 4, [1, 2, 3, 1, 2, 3, 1]))
}

fileprivate func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var score = score
    var result = 0
    score.sort(by: >)
    
    for num in stride(from: 0, through: score.count, by: m) {
        let lastIndex = num + m - 1
        if lastIndex < score.count {
            result += score[num+m-1] * m
        }
    }
    
    return result
}
