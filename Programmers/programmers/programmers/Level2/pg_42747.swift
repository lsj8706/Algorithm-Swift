//
//  pg_42747.swift
//  programmers
//
//  Created by sejin on 2022/09/22.
//
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42747
// H-Index

import Foundation

func solve42747() {
    print(solution([3, 0, 6, 1, 5]))
}

fileprivate func solution(_ citations:[Int]) -> Int {
    let size = citations.count
    var h = size
    
    while true {
        var cnt = 0
        for citation in citations {
            if citation >= h {
                cnt += 1
            }
        }
        
        if cnt >= h && size - cnt <= h {
            break
        }
        
        h -= 1
    }
    
    return h
}
