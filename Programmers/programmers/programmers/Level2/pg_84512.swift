//
//  pg_84512.swift
//  programmers
//
//  Created by sejin on 2023/02/24.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/84512
// 모음 사전

import Foundation

func solve84512() {
    print(solution("AAAAE"))
}

fileprivate func solution(_ word:String) -> Int {
    let alphabets = ["A", "E", "I", "O", "U"]
    var count = 0
    
    func dfs(current: String) -> Bool {
        count += 1

        if current == word {
            return true
        }
        
        if current.count == 5 {
            return false
        }
        
        for alphabet in alphabets {
            if dfs(current: current+alphabet) {
                return true
            }
        }
        
        return false
    }
    
    for alphabet in alphabets {
        if dfs(current: alphabet) {
            return count
        }
    }
    
    return count
}
