//
//  pg_12905.swift
//  programmers
//
//  Created by sejin on 2022/08/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12905
// 가장 큰 정사각형 찾기

import Foundation

func solve12905() {
    print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]))
}

fileprivate func solution(_ board:[[Int]]) -> Int {
    var ans = 0
    var dp = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    
    for i in 1..<board.count+1 {
        for j in 1..<board[0].count+1 {
            
            if board[i-1][j-1] == 1 {
                dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1
                
                if dp[i][j] > ans {
                    ans = dp[i][j]
                }
            }
        }
    }
    
    return ans*ans
}
