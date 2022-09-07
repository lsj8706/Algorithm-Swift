//
//  pg_12909.swift
//  programmers
//
//  Created by sejin on 2022/09/07.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12909
// 올바른 괄호

import Foundation

func solve12909() {
    print(solution("()()"))
}

fileprivate func solution(_ s:String) -> Bool
{
    var ans = true
    var stack = [Character]()
    
    for c in s {
        if c == "(" {
            stack.append(c)
        } else {
            if stack.count >= 1 {
                stack.removeLast()
            } else {
                return false
            }
        }
    }
    
    if stack.count >= 1 {
        ans = false
    }

    return ans
}
