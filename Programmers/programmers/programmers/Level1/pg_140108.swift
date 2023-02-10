//
//  pg_140108.swift
//  programmers
//
//  Created by sejin on 2023/02/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/140108
// 문자열 나누기

import Foundation

func solve140108() {
    print(solution("abracadabra"))
}

private func solution(_ s:String) -> Int {
    var s = Array(s)
    var result = 0
    var shouldRun = true
    
    while shouldRun {
        if s.count == 0 {
            break
        }
        
        if s.count == 1 {
            result += 1
            break
        }
    
        var numOfX = 0
        var numOfOther = 0
        let x = s.first!
        
        for (index, char) in s.enumerated() {
            if char == x {
                numOfX += 1
            } else {
                numOfOther += 1
            }
            
            if numOfX == numOfOther {
                let i = index + 1
                s = Array(s[i...])
                result += 1
                break
            } else if index == s.count - 1 {
                result += 1
                shouldRun = false
                break
            }
        }
    }
    
    return result
}
