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
    var graph = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
    
    for vertex in edge {
        graph[vertex[0]][vertex[1]] = true
        graph[vertex[1]][vertex[0]] = true
    }
    
    var visited = Array(repeating: -1, count: n+1)
    
    var queue = [Int]()
    
    visited[1] = 0
    
    for i in 1..<n+1 {
        if graph[1][i] == true {
            visited[i] = 1
            queue.append(i)
        }
    }
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        for i in 1..<n+1 {
            if graph[first][i] == true && visited[i] == -1 {
                visited[i] = visited[first] + 1
                queue.append(i)
            }
        }
    }
    
    let farthestNodes = visited.max()!
    
    return visited.filter { $0 == farthestNodes }.count
}
