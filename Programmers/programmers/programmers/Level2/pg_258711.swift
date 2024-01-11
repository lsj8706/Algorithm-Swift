//
//  pg_258711.swift
//  programmers
//
//  Created by sejin on 1/11/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/258711
//  도넛과 막대 그래프

import Foundation

func solve258711() {
//    print(solution([[2, 3], [4, 3], [1, 1], [2, 1]]))
    print(solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]))
}

fileprivate func solution(_ edges:[[Int]]) -> [Int] {
    var graph = [Int: [Int]]()
    var edgeSum = [Int: Int]() // key 정점에서 시작하는 엣지 수 - key 정점으로 도착하는 엣지 수
    
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
        
        edgeSum[edge[0], default: 0] += 1
        edgeSum[edge[1], default: 0] -= 1
    }
    
    let center = edgeSum.max { $0.value < $1.value }!.key // 임의로 생성한 정점
    
    var result = [center, 0, 0, 0] // [생성한 정점, 도넛, 막대, 8자]
    
    func checkShape(now: Int, visited: Set<Int>) {
        let adjacentNodes = graph[now, default: []]
        
        if adjacentNodes.isEmpty { // 막대
            result[2] += 1
            return
        }
        
        if adjacentNodes.count >= 2 { // 8자
            result[3] += 1
            return
        }
        
        for node in adjacentNodes {
            if visited.contains(node) { // 도넛
                result[1] += 1
                return
            }
            
            checkShape(now: node, visited: visited.union([node]))
        }
    }
    
    let centerAdjacentNodes = graph[center, default: []]
    
    for node in centerAdjacentNodes {
        checkShape(now: node, visited: [])
    }
    
    return result
}
