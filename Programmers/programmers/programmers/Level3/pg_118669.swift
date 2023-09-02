//
//  pg_118669.swift
//  programmers
//
//  Created by sejin on 2023/09/02.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/118669
//  등산 코스 정하기

import Foundation

func solve118669() {
    print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
}

fileprivate func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var graph = Graph()
    
    for path in paths {
        graph.insert(node1: path[0], node2: path[1], cost: path[2])
    }
    
    let setGates = Set(gates)
    let setSummits = Set(summits)
    
    var result = Answer(summit: n, idensity: 10_000_000)
    
    func bfs(start: Int, end: Int) {
        var queue = [(node: Int, cost: Int)]()
        queue.append((start, 0))
        
        var visited = Array(repeating: false, count: n+1)
        visited[start] = true
                
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let curCost = cur.cost
            
            if cur.node == end {
                result.compareAndupdate(summit: end, idensity: curCost)
            }
            
            let adjacentNodes = graph.getAdjacentNodes(node: cur.node)

            for (node, cost) in adjacentNodes {
                if visited[node] == false && !setGates.contains(node) {
                    if (node != end) && setSummits.contains(node) {
                        continue
                    }
                    
                    let nextCost = max(curCost, cost)

                    if nextCost > result.idensity {
                        continue
                    }

                    if !setSummits.contains(node) {
                        visited[node] = true
                    }
                                        
                    queue.append((node, nextCost))
                }
            }
        }
    }
    
    for gate in gates {
        for summit in summits {
            bfs(start: gate, end: summit)
        }
    }
    
    
    return result.toArray
}

fileprivate struct Graph {
    var data: [Int: [Int: Int]] = [:] // key: 노드, value: [key 노드와 연결된 노드: 가중치(비용)]
    
    mutating func insert(node1: Int, node2: Int, cost: Int) {
        self.data[node1, default: [:]].updateValue(cost, forKey: node2)
        self.data[node2, default: [:]].updateValue(cost, forKey: node1)
    }
    
    func getAdjacentNodes(node: Int) -> [Int: Int] {
        return data[node, default: [:]]
    }
}

fileprivate struct Answer {
    let summit: Int
    let idensity: Int
    
    var toArray: [Int] {
        return [summit, idensity]
    }
    
    mutating func compareAndupdate(summit: Int, idensity: Int) {
        if self.idensity > idensity {
            self = Answer(summit: summit, idensity: idensity)
        } else if self.idensity == idensity {
            if summit < self.summit {
                self = Answer(summit: summit, idensity: idensity)
            }
        }
    }
}

// 돌아오는건 고려 X 같은 루트로 돌아오면 됨
// 각 출발지 반복문, 각 봉우리 반복문 a -> b 까지의 최단 경로 구하기
