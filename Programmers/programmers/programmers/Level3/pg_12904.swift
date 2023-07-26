//
//  pg_12904.swift
//  programmers
//
//  Created by sejin on 2023/07/26.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/12904
//  가장 긴 펠린드롬

import Foundation

func solve12904() {
    print(solution("abcdcba"))
}

fileprivate func solution(_ s:String) -> Int {
    let s = Array(s)
    
    for length in stride(from: s.count, to: 0, by: -1) {
        outer: for startIndex in 0...s.count-length {
            var start = startIndex
            var end = startIndex + length - 1
            
            // 팰린드롬인지 확인
            while start < end {
                if s[start] != s[end] {
                    continue outer
                }
                start += 1
                end -= 1
            }
            
            return length
        }
    }

    return 0
}

