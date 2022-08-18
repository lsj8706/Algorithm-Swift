//
//  pg_12921.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/05.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12921
// 소수 찾기
// 에라토스트네스 체

import Foundation

func solve12921() {
    print(solution(5))
}

fileprivate func solution(_ n:Int) -> Int {
    var ch = Array(repeating: 0, count: n+1)
    var cnt = 0
    
    
    for i in 2...n {
        if ch[i] == 0 {
            cnt += 1
            for j in stride(from: i, to: n+1, by: i) {
                ch[j] = 1
            }
        }
    }
    
    return cnt
}
