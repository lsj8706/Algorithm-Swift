//
//  pg_181186.swift
//  programmers
//
//  Created by sejin on 2/1/24.
//
//  아방가르드 타일링
//  https://school.programmers.co.kr/learn/courses/30/lessons/181186

import Foundation

func solve181186() {
  print(solution(10))
}

// 참고: https://alreadysolved.tistory.com/15
fileprivate func solution(_ n:Int) -> Int {
  var dp = Array(repeating: 0, count: 100001)
  var sum = Array(repeating: 0, count: 3)

  dp[0] = 1
  dp[1] = 1
  dp[2] = 3
  dp[3] = 10

  let mod = 1_000_000_007
  
  if n <= 3 {
    return dp[n]
  }
  
  for i in 4...n {
    dp[i] += dp[i-1] + dp[i-2]*2 + dp[i-3]*5
    sum[(i-4)%3] = (sum[(i-4)%3] + dp[i-4]) % mod
    dp[i] += (sum[0] + sum[1] + sum[2] + sum[i%3])*2
    dp[i] %= mod
  }
  
  return dp[n]
}
