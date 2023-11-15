//
//  pg_138475.swift
//  programmers
//
//  Created by sejin on 2023/11/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/138475
//  억억단을 외우자

import Foundation

func solve138475() {
    print(solution(8, [1,3,7]))
}

fileprivate func solution(_ e:Int, _ starts:[Int]) -> [Int] {
    var count = Array(repeating: 0, count: e+1) // count[i]는 i의 약수의 개수
    
    for i in 1...e {
        for j in 1...e/i {
            count[i*j] += 1
        }
    }

    var dp = Array(repeating: 0, count: e+1) // dp[i]는 i...e 범위의 수 중에서 억억단에서 가장 많이 등장한 수
    
    dp[e] = e
    
    for i in stride(from: e-1, to: 0, by: -1) {
        if count[dp[i+1]] <= count[i] {
            dp[i] = i
        } else {
            dp[i] = dp[i+1]
        }
    }

    var result = [Int]()
    
    for start in starts {
        result.append(dp[start])
    }
    
    return result
}
