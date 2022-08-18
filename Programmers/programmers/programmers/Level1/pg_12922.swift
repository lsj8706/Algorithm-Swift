//
//  pg_12922.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/05.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12922
// 수박수박수박수박수박수?

import Foundation

func solve12922() {
    print(solution(3))
}

fileprivate func solution(_ n:Int) -> String {
    var ans = String(repeating: "수박", count: n / 2)
    if n % 2 != 0 {
        ans.append("수")
    }
    return ans
}
