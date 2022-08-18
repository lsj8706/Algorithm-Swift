//
//  pg_12982.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/10.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12982
// 예산

import Foundation

func solve12982() {
    print(solution([1,3,2,5,4], 9))
}

fileprivate func solution(_ d:[Int], _ budget:Int) -> Int {
    let depts = d.sorted()
    var budget = budget
    var cnt = 0
    for dept in depts {
        if budget - dept >= 0 {
            budget -= dept
            cnt += 1
        } else {
            break
        }
    }
    
    return cnt
}
