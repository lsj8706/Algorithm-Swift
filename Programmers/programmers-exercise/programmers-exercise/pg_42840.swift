//
//  pg_42840.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/13.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42840
// 모의고사

import Foundation

func solve42840() {
    print(solution([1,3,2,4,2]))
}

fileprivate func solution(_ answers:[Int]) -> [Int] {
    let first = [1, 2, 3, 4, 5]
    let second = [2, 1, 2, 3, 2, 4, 2, 5]
    let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var scores = Array(repeating: 0, count: 3)
    
    for i in 0..<answers.count {
        if answers[i] == first[i % first.count] {
            scores[0] += 1
        }
        if answers[i] == second[i % second.count] {
            scores[1] += 1
        }
        if answers[i] == third[i % third.count] {
            scores[2] += 1
        }
    }
    
    let maxScore = scores.max()
    var res = [Int]()
    for i in 0..<scores.count {
        if scores[i] == maxScore {
            res.append(i+1)
        }
    }
    return res
}
