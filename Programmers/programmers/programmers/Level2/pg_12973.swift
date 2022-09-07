//
//  pg_12973.swift
//  programmers
//
//  Created by sejin on 2022/09/07.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12973
// 짝지어 제거하기

import Foundation

func solve12973() {
    print(solution("baabaa"))
}

fileprivate func solution(_ s:String) -> Int{
    var s = s
    var answer:Int = 0

    var isValid = true
    
    while isValid {
        var temp = ""

        for c in s {
            if let last = temp.last {
                if last == c {
                    temp.removeLast()
                } else {
                    temp.append(c)
                }
            } else {
                temp.append(c)
            }
        }
        
        if temp == s {
            isValid = false
        } else {
            s = temp
        }
    }
    
    if s == "" {
        answer = 1
    }

    return answer
}
