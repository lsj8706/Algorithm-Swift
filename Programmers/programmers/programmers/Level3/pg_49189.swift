//
//  pg_49189.swift
//  programmers
//
//  Created by sejin on 2023/07/17.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/49189
//  가장 먼 노드

import Foundation

func solve49189() {
    print(solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]]))
}

fileprivate func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int](), count: n+1)
    
    for vertex in edge {
        graph[vertex[0]].append(vertex[1])
        graph[vertex[1]].append(vertex[0])
    }
    
    var distance = Array(repeating: -1, count: n+1)
    
    var queue = [Int]()
    
    distance[1] = 0
    
    // 1번 노드와 연결된 노드들을 큐에 넣는다.
    for i in graph[1] {
        distance[i] = 1
        queue.append(i)
    }
    
    // BFS
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        for i in graph[first] {
            if distance[i] == -1 {
                distance[i] = distance[first] + 1
                queue.append(i)
            }
        }
    }
    
    // 1번 노드로부터 가장 멀리 떨어지 노드까지의 거리
    let farthestDistance = distance.max()!
    
    return distance.filter { $0 == farthestDistance }.count
}
