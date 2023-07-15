//
//  pg_64062.swift
//  programmers
//
//  Created by sejin on 2023/07/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/64062
//  징검다리 건너기

import Foundation

func solve64062() {
    print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
}

fileprivate func solution(_ stones:[Int], _ k:Int) -> Int {
    // 징검다리를 건너는 사람 수로 이분 탐색
    var start = 0
    var end = 200_000_000
    
    while start <= end {
        let mid = (start + end) / 2
        var cnt = 0
        
        var canMove = true
        for i in 0..<stones.count {
            if stones[i] - mid <= 0 {
                cnt += 1
            } else {
                cnt = 0
            }
            
            if cnt >= k {
                canMove = false
                break
            }
        }
        
        if canMove {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return start
}
