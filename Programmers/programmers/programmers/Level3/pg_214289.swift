//
//  pg_214289.swift
//  programmers
//
//  Created by sejin on 2/5/24.
//
//  에어컨
//  https://school.programmers.co.kr/learn/courses/30/lessons/214289

import Foundation

func solve214289() {
  print(solution(28, 18, 26, 10, 8, [0, 0, 1, 1, 1, 1, 1]))
}

// 참고: https://school.programmers.co.kr/questions/52432

fileprivate func solution(_ temperature:Int, _ t1:Int, _ t2:Int, _ a:Int, _ b:Int, _ onboard:[Int]) -> Int {
  let temperature = temperature + 10
  let t1 = t1 + 10
  let t2 = t2 + 10
  let n = onboard.count
  
  var dp = Array(repeating: Array(repeating: 1000*100, count: 52), count: n) // dp[i][j]는 i분일 때 j도가 되도록 하는 최소 소비 전력
  
  dp[0][temperature] = 0
  
  for i in 1..<n {
    for j in 0..<dp[0].count-1 {
      
      if onboard[i] == 1 && (j < t1 || j > t2) {
        continue
      }
      
      if j > temperature {
        // j-1도를 j로 높이는 경우 -> 에어컨 on
        if j-1 >= 0 {
          dp[i][j] = min(dp[i][j], dp[i-1][j-1] + a)
        }
        
        // j+1도를 j로 낮추는 경우 -> 에어컨 off
        dp[i][j] = min(dp[i][j], dp[i-1][j+1])
        
        // j도 유지 -> 에어컨 on
        dp[i][j] = min(dp[i][j], dp[i-1][j] + b)
      } else if j < temperature {
        // j-1도를 j로 높이는 경우 -> 에어컨 off
        if j-1 >= 0 {
          dp[i][j] = min(dp[i][j], dp[i-1][j-1])
        }
        
        // j+1도를 j로 낮추는 경우 -> 에어컨 on
        dp[i][j] = min(dp[i][j], dp[i-1][j+1] + a)
        
        // j도 유지 -> 에어컨 on
        dp[i][j] = min(dp[i][j], dp[i-1][j] + b)
      } else {
        // j-1도를 j로 높이는 경우 -> 에어컨 off
        if j-1 >= 0 {
          dp[i][j] = min(dp[i][j], dp[i-1][j-1])
        }
        
        // j+1도를 j로 낮추는 경우 -> 에어컨 off
        dp[i][j] = min(dp[i][j], dp[i-1][j+1])
        
        // j도 유지 -> 에어컨 off
        dp[i][j] = min(dp[i][j], dp[i-1][j])
      }
    }
  }

  return dp[n-1].min()!
}
