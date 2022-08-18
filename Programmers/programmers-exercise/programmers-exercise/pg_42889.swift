//
//  pg_42889.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42889
// 실패율

import Foundation

func solve42889() {
    print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
}

fileprivate func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var peopleInStage = Array(repeating: 0, count: N+2)
    var numOfReach = Array(repeating: 0, count: N+3)
    var failRate = Array(repeating: 0.0, count: N+2)

    for stage in stages{
        peopleInStage[stage] += 1
    }

    for i in stride(from: N+1, through: 1, by: -1) {
        numOfReach[i] = numOfReach[i+1] + peopleInStage[i]
        failRate[i] = Double(peopleInStage[i]) / Double(numOfReach[i])
    }
    return failRate[1...N].enumerated().sorted(by: { $0.1 > $1.1 }).map{ $0.0 + 1 }
}
