//
//  pg_132266.swift
//  programmers
//
//  Created by sejin on 2023/08/04.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/132266
//  부대복귀

import Foundation

func solve132266() {
    print(solution(3, [[1, 2], [2, 3]], [2, 3], 1))
}

fileprivate func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var graph = [Int: [Int]]()
    
    for road in roads {
        graph[road[0], default: []].append(road[1])
        graph[road[1], default: []].append(road[0])
    }
    
    var distance = Array(repeating: -1, count: n+1) // i 번째 지역에서 destination 까지의 최단 거리, 이 값은 destination에서 i번째 지역까지의 최단 거리로 생각 가능
    distance[destination] = 0
    
    bfs(departure: destination, graph: graph, distance: &distance)
    
    return sources.map { distance[$0] }
}

fileprivate func bfs(departure: Int, graph: [Int: [Int]], distance: inout [Int]) {
    var queue = [Int]()
    queue.append(departure)
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        let nextNodes = graph[cur, default: []]
        
        for node in nextNodes {
            if distance[node] != -1 { continue }
            distance[node] = distance[cur] + 1
            queue.append(node)
        }
    }
}
