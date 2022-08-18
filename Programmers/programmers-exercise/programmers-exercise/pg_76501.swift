//
//  pg_76501.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/14.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/76501
// 음양 더하기

import Foundation

func solve76501() {
    print(solution([4,7,12], [true, false, true]))
}

fileprivate func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var ans = 0
    
    for i in 0..<absolutes.count {
        ans += signs[i] == true ? absolutes[i] : -absolutes[i]
    }
    
    return ans
}
