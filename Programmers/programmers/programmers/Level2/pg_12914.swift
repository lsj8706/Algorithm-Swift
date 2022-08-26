//
//  pg_12914.swift
//  programmers
//
//  Created by sejin on 2022/08/26.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12914
// 멀리 뛰기

import Foundation

func solve12914() {
    print(solution(5))
}

fileprivate func solution(_ n:Int) -> Int {
    
    if n == 1 || n == 2 {
        return n
    }
    
    var arr = Array(repeating: 0, count: n+1) // 각 인덱스는 칸위 위치 -> 인덱스 3은 3번째 칸 까지 가는 총 경우의 수
    
    arr[1] = 1
    arr[2] = 2
    
    for i in 3...n {
        arr[i] = (arr[i-1] + arr[i-2]) % 1234567
    }
        
    return arr[n]
}
