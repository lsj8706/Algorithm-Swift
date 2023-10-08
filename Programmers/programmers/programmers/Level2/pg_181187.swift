//
//  pg_181187.swift
//  programmers
//
//  Created by sejin on 2023/10/08.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/181187
//  두 원 사이의 정수 쌍

import Foundation

func solve181187() {
    print(solution(10, 20))
    print(solution(2, 3))
    print(solution(2, 4))
}

fileprivate func solution(_ r1:Int, _ r2:Int) -> Int64 {
    return Int64(getAllCntInCircle(r1: r1, r2: r2))
}

fileprivate func getAllCntInCircle(r1: Int, r2: Int) -> Int {
    let cntInAllQuadrant = getCntInOneQuadrant(r1: r1, r2: r2) * 4
    let cntInYLine = (r2-r1 + 1) * 2
    let cntIntXLine = cntInYLine
    return cntInAllQuadrant + cntInYLine - cntIntXLine
}

// 원의 1사분면에 있는 점의 개수 (x선 위 포함, y선 위 불포함)
fileprivate func getCntInOneQuadrant(r1: Int, r2: Int) -> Int {
    var cnt = 0
    
    for x in 1...r2 {
        if x <= r1 {
            let y1 = ceil(sqrt(Double(r1*r1 - x*x)))
            let y2 = floor(sqrt(Double(r2*r2 - x*x)))
            let temp = Int(y2 - y1) + 1
            cnt += temp
        } else {
            let y2 = sqrt(Double(r2*r2 - x*x))
            let temp = Int(y2)
            cnt += temp + 1
        }
    }
    
    return cnt
}
