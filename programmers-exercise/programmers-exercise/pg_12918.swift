//
//  pg_12918.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/07.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12918
// 문자열 다루기 기본

import Foundation

func solve12918() {
    print(solution("1234"))
}

fileprivate func solution(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        if (s.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil) {
            return true
        }
        return false
    }
    
    return false
}
