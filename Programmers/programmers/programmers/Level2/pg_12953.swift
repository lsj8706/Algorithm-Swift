//
//  pg_12953.swift
//  programmers
//
//  Created by sejin on 2022/08/19.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12953
// N개의 최소공배수

import Foundation

func solve12953() {
    print(solution([2,6,8,14]))
}

fileprivate func solution(_ arr:[Int]) -> Int {
    let multiplied = arr.reduce(1, *)
    let maxValue = arr.max()!
    var res = maxValue
    
    for i in maxValue...multiplied {
        var satisfied = true
        for value in arr {
            if i % value != 0 {
                satisfied = false
                break
            }
        }
        
        if satisfied {
            res = i
            break
        }
    }
    
    return res
}
