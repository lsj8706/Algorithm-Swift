//
//  pg_140107.swift
//  programmers
//
//  Created by sejin on 2023/06/08.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/140107
//  점 찍기

import Foundation

func solve140107() {
    print(solution(1, 5))
}


// x랑 y 각각 k의 배수이고 d 이하여야 한다.
fileprivate func solution(_ k:Int, _ d:Int) -> Int64 {
    var result: Int64 = 0
    var x: Int = 0
    
    while x <= d {
        // x에 대해 최대 y 좌표 구하기
        let maxY = Int(sqrt(Double(d*d - x*x)))
        let cnt = Int64(maxY / k) + 1
        result += cnt
        x = x+k
    }
    
    return result
}
