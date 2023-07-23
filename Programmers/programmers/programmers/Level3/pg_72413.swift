//
//  pg_72413.swift
//  programmers
//
//  Created by sejin on 2023/07/23.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/72413
//  합승 택시 요금

import Foundation

func solve72413() {
    print(solution(6, 4, 6, 2, [[4, 1, 10], [3, 5, 24], [5, 6, 2], [3, 1, 41], [5, 1, 24], [4, 6, 50], [2, 4, 66], [2, 3, 22], [1, 6, 25]]))
}

fileprivate func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    // Floyd-Warshall (플로이드 와샬 알고리즘)
    var distance = Array(repeating: Array(repeating: 1_000_000, count: n+1), count: n+1)
    
    for i in 1..<n+1 {
        distance[i][i] = 0
    }
    
    for fare in fares {
        let departure = fare[0]
        let arrival = fare[1]
        distance[departure][arrival] = fare[2]
        distance[arrival][departure] = fare[2]
    }
    
    for k in 1..<n+1 {
        for i in 1..<n+1 {
            for j in 1..<n+1 {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }
    
    var result = Int.max
    
    for k in 1..<n+1 {
        result = min(result, distance[s][k]+distance[k][a]+distance[k][b])
    }
    
    return result
}
