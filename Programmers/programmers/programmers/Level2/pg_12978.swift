//
//  pg_12978.swift
//  programmers
//
//  Created by sejin on 2022/09/08.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12978
// 배달 (플로이드 워샬)

import Foundation

func solve12978() {
    print(solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4))
}

fileprivate func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    let INF = 999999

    var graph = Array(repeating: Array(repeating: INF, count: N+1), count: N+1)
    
    for i in 1...N {
        graph[i][i] = 0
    }
    
    for r in road {
        let a = r[0]
        let b = r[1]
        let c = r[2]
        graph[a][b] = min(graph[a][b], c)
        graph[b][a] = min(graph[b][a], c)
    }
    
    for k in 1...N {
        for i in 1...N {
            for j in 1...N {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
        
    var answer = 0
    for distance in graph[1] {
        if distance <= k {
            answer += 1
        }
    }

    return answer
}
