//
//  pg_70128.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/14.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/70128
// 내적

import Foundation

func solve70128() {
    print(solution([1,2,3,4], [-3,-1,0,2]))
}

fileprivate func solution(_ a:[Int], _ b:[Int]) -> Int {
    var ans = 0
    for i in 0..<a.count {
        ans += a[i]*b[i]
    }
    
    return ans
}
