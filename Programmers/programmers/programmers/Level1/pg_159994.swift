//
//  pg_159994.swift
//  programmers
//
//  Created by sejin on 2023/05/12.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/159994
//  카드 뭉치

import Foundation

func solve159994() {
    print(solution(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
}

fileprivate func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    
    var result: Bool = false
    
    func dfs(cards1: [String], cards2: [String], now: [String]) {
        
        var cards1 = cards1
        var cards2 = cards2
        
        if now.count == goal.count {
            if now == goal { result = true }
            return
        }
        
        if !cards1.isEmpty {
            let first = cards1.removeFirst()
            dfs(cards1: cards1, cards2: cards2, now: now + [first])
            cards1.insert(first, at: 0)
        }
        
        if !cards2.isEmpty {
            let first = cards2.removeFirst()
            dfs(cards1: cards1, cards2: cards2, now: now + [first])
            cards2.insert(first, at: 0)
        }
    }
    
    dfs(cards1: cards1, cards2: cards2, now: [])
    
    return result ? "Yes" : "No"
}
