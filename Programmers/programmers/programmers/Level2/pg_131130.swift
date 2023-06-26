//
//  pg_131130.swift
//  programmers
//
//  Created by sejin on 2023/06/26.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/131130
//  혼자 놀기의 달인

import Foundation

func solve131130() {
    print(solution([8,6,3,7,2,5,1,4]))
}

fileprivate func solution(_ cards:[Int]) -> Int {
    let cards = cards.map { $0-1 }
    var result = 0
    
    var visited = Array(repeating: false, count: cards.count)
    
    
    // 1그룹 탐색
    func dfs(i: Int, cnt: Int) {
        // 1그룹 종료 + 2그룹 시작
        if visited[i] {
            for j in 0..<cards.count {
                if !visited[j] {
                    dfs2(i: j, cnt: 0, visited: visited, groupOneCnt: cnt)
                }
            }
            return
        }
        
        visited[i] = true
        
        let next = cards[i]
        
        dfs(i: next, cnt: cnt+1)
    }
    
    // 2그룹 탐색
    func dfs2(i: Int, cnt: Int, visited: [Bool], groupOneCnt: Int) {
        if visited[i] {
            // 종료
            result = max(result, groupOneCnt * cnt)
            return
        }
        
        var visited = visited
        
        visited[i] = true
        
        let next = cards[i]
        
        dfs2(i: next, cnt: cnt+1, visited: visited, groupOneCnt: groupOneCnt)
    }
    
    for i in 0..<cards.count {
        if !visited[i] {
            dfs(i: i, cnt: 0)
        }
    }
    
    return result
}
