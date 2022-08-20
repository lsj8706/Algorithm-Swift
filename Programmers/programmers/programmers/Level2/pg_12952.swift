//
//  pg_12952.swift
//  programmers
//
//  Created by sejin on 2022/08/20.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12952
// N-Queen

import Foundation

func solve12952() {
    print(solution(12))
}

fileprivate func solution(_ n:Int) -> Int {
    
    var cnt = 0
    var visited = Array(repeating: false, count: n) // 세로 체크
    
    func recursion(_ now: [Int]) {
        if now.count == n {
            cnt += 1
            return
        }
        
        for i in 0..<n {
            var isValid = true
            
            // 세로를 먼저 체크해서 이미 같은 x축에 퀸이 놓여 있다면 대각선을 체크하지 않고 바로 다음 위치로 넘어가기
            if visited[i] == true {
                continue
            }
            
            for (idx, position) in now.enumerated() {
                // 대각선 체크
                if abs(now.count - idx) == abs(i - position) {
                    isValid = false
                    break
                }
            }
            
            if isValid {
                visited[i] = true
                recursion(now + [i])
                visited[i] = false
            }
        }
    }
    
    recursion([])
    
    return cnt
}
