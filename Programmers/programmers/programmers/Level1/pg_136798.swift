//
//  pg_136798.swift
//  programmers
//
//  Created by sejin on 2023/01/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/136798
// 기사단원의 무기

import Foundation

func solve136798() {
    print(solution(5, 3, 2))
}

fileprivate func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var result = 0
    
    for num in 1...number {
        let divisorCount = getDivisorCount(num)
        result += divisorCount > limit ? power : divisorCount
    }
    
    return result
}

// 약수의 개수 구하기
public func getDivisorCount(_ N : Int) -> Int {
    var i = 1
    var answer = 0
    while i*i <= N {
        if (N % i == 0) {
            if (i*i == N) {
                answer += 1
            } else {
                answer += 2
            }
        }
        
        i += 1
    }
    
    return answer
}
