//
//  pg_154538.swift
//  programmers
//
//  Created by sejin on 2023/05/08.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/154538
//  숫자 변환하기

import Foundation

func solve154538() {
  print(solution(5, 5, 4))
}

fileprivate func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var isFound = false
    var result = Int.max
    
    func dfs(now: Int, cnt: Int) {
        if cnt >= result {
            return
        }
        
        if now == y {
            result = min(result, cnt)
            isFound = true
            return
        }
        
        if now > y {
            return
        }
        
        for i in 0...2 {
            if i == 0 {
                dfs(now: now+n, cnt: cnt+1)
            } else if i == 1 {
                dfs(now: now*2, cnt: cnt+1)
            } else {
                dfs(now: now*3, cnt: cnt+1)
            }
        }
    }
    
    dfs(now: x, cnt: 0)
    
    return isFound ? result : -1
}
