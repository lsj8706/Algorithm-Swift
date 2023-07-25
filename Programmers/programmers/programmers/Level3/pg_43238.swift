//
//  pg_43238.swift
//  programmers
//
//  Created by sejin on 2023/07/25.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/43238
//  입국심사

import Foundation

func solve43238() {
    print(solution(6, [7, 10]))
}

fileprivate func solution(_ n:Int, _ times:[Int]) -> Int64 {
    var start = 0
    var end = times.max()! * n
    
    while start <= end {
        let mid = (start+end) / 2   // 시간 (이분 탐색 대상)
        var cnt = 0     // 주어진 시간(mid) 동안 처리 가능한 사람의 수
        
        for time in times {
            cnt += mid / time
        }
        
        if cnt >= n {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    
    return Int64(start)
}
