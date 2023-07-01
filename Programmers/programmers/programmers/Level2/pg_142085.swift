//
//  pg_142085.swift
//  programmers
//
//  Created by sejin on 2023/07/01.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/142085
//  디펜스 게임

import Foundation

func solve142085() {
//    print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
    print(solution(2, 4, [3, 3, 3, 3]))
}

fileprivate func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    
    var result = 0
    
    func dfs(i: Int, soldiers: Int, chance: Int) {
        if i == enemy.count && soldiers >= 0 {
            result = i
            return
        }
        
        if soldiers <= 0 {
            result = max(result, i-1)
            return
        }
        
        dfs(i: i+1, soldiers: soldiers-enemy[i], chance: chance)
        
        if chance >= 1 {
            dfs(i: i+1, soldiers: soldiers, chance: chance-1)
        }
    }
    
    dfs(i: 0, soldiers: n, chance: k)
    
    return result
}
