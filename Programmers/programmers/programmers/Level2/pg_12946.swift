//
//  pg_12946.swift
//  programmers
//
//  Created by sejin on 2022/08/21.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12946
// 하노이의 탑

import Foundation

func solve12946() {
    print(solution(2))
}

fileprivate func solution(_ n:Int) -> [[Int]] {
    var res = [[Int]]()
    
    func hanoi(_ n: Int, from: Int, to: Int, assist: Int) {
        if n == 1 {
            res.append([from, to])
            return
        }
        
        hanoi(n-1, from: from, to: assist, assist: to)
        res.append([from, to])
        hanoi(n-1, from: assist, to: to, assist: from)
    }
    
    hanoi(n, from: 1, to: 3, assist: 2)
    
    return res
}

