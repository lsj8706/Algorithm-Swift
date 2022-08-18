//
//  pg_12943.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12943
// 콜라츠 추측

import Foundation

func solve12943() {
    let result = solution(6)
    print(result)
}

fileprivate func solution(_ num:Int) -> Int {
    if num == 1 { return 0 }
    
    var value = num
    var cnt = 0
    
    while value != 1 && cnt <= 500 {
        if value % 2 == 0 {
            value /= 2
        } else {
            value = 3*value + 1
        }
        cnt += 1
    }
    
    return value == 1 ? cnt : -1
}
