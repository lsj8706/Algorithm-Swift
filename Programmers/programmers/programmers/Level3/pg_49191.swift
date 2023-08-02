//
//  pg_49191.swift
//  programmers
//
//  Created by sejin on 2023/08/02.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/49191
//  순위

import Foundation
import SwiftDataStructure

func solve49191() {
    print(solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]]))
}

fileprivate func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var loserDict = [Int: [Int]]() // key: 선수 번호, value: key의 선수에게 패배한 선수들의 목록
    var winnerDict = [Int: [Int]]() // key: 선수 번호, value: key의 선수를 상대로 이긴 선수들의 목록
    
    for result in results {
        let winner = result[0]
        let loser = result[1]
        loserDict[winner, default: []].append(loser)
        winnerDict[loser, default: []].append(winner)
    }
    
    // 자신을 이긴 사람의 수 + 지산이 이긴 사람의 수가 n-1이면 순위를 정확하게 매길 수 있다.
    var result = 0
    for num in 1...n {
        // 자신보다 순위가 높은 사람 수
        let highRankCnt = bfs(dict: winnerDict, num: num)
        // 자신보다 순위가 낮은 사람 수
        let lowRankCnt = bfs(dict: loserDict, num: num)
        
        if highRankCnt + lowRankCnt == n-1 {
            result += 1
        }
    }
    
    return result
}

fileprivate func bfs(dict: [Int: [Int]], num: Int) -> Int {
    var queue = Queue<Int>()
    var ch = Set<Int>()
    queue.enqueue(num)
    ch.insert(num)
    
    var cnt = 0
    
    while !queue.isEmpty {
        let node = queue.dequeue()!
        
        let children = dict[node, default: []]
        
        for child in children {
            if !ch.contains(child) {
                queue.enqueue(child)
                ch.insert(child)
                cnt += 1
            }
        }
    }
    
    return cnt
}
