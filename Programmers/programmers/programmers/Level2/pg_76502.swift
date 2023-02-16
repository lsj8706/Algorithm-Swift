//
//  pg_76502.swift
//  programmers
//
//  Created by sejin on 2023/02/16.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/76502
// 괄호 회전하기

import Foundation

func solve76502() {
    print(solution("[](){}"))
}

fileprivate func solution(_ s:String) -> Int {
    var s = s
    var result = 0
    
    for _ in 0..<s.count {
        let isProperForm = checkIsProperForm(s)
        if isProperForm {
            result += 1
        }
        
        let firstChar = s.first!
        let startIdx = s.index(s.startIndex, offsetBy: 1)
        s = String(s[startIdx...]) + String(firstChar)
    }
    
    return result
}

fileprivate func checkIsProperForm(_ s: String) -> Bool {
    var brackets = [Character]() // 스택
    
    func checkIsPair(first: Character, second: Character) -> Bool {
        switch (first, second) {
        case ("(", ")"), ("{","}"), ("[","]"):
            return true
        default:
            return false
        }
    }
    
    for char in s {
        switch char {
        case "(", "{", "[":
            brackets.append(char)
        case ")", "}", "]":
            if let lastBracket = brackets.popLast() {
                let isPair = checkIsPair(first: lastBracket, second: char)
                if !isPair {
                    return false
                }
            } else {
                // 닫는 bracket이 먼저 나오는 경우 올바르지 않은 형태
                return false
            }
        default:
            break
        }
    }
    
    if brackets.count == 0 {
        return true
    }
    
    return false
}
