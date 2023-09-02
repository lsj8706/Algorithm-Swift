//
//  pg_118669.swift
//  programmers
//
//  Created by sejin on 2023/09/02.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/118669
//  등산 코스 정하기

import Foundation
import SwiftDataStructure

func solve118669() {
    print(solution(6, [[1, 2, 3], [2, 3, 5], [2, 4, 2], [2, 5, 4], [3, 4, 4], [4, 5, 3], [4, 6, 1], [5, 6, 1]], [1, 3], [5]))
}

fileprivate func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var graph = Graph(gates: Set(gates), summits: Set(summits))
    
    for path in paths {
        graph.insert(node1: path[0], node2: path[1], cost: path[2])
    }
    
    func dijkstra(start: Int) -> [Int] {
        var intensity = Array(repeating: 10_000_000, count: n+1)
        intensity[start] = 0
        
        var pq = PriorityQueue<Node> {
            $0.cost < $1.cost
        }
        
        pq.enqueue(Node(name: start, cost: 0))
        
        while !pq.isEmpty {
            let cur = pq.dequeue()!
            let curCost = cur.cost
            
            if intensity[cur.name] < curCost {
                continue
            }
            
            let adjacents = graph.getAdjacentNodes(node: cur.name)
            
            for (next, cost) in adjacents {
                let nextCost = max(curCost, cost)
                
                if intensity[next] > nextCost {
                    intensity[next] = nextCost
                    pq.enqueue(Node(name: next, cost: nextCost))
                }
            }
        }
        
        return intensity
    }
    
    var answer = Answer(summit: n, idensity: 10_000_000)
    
    for gate in gates {
        let maxIntensity = dijkstra(start: gate)
        
        for summit in summits {
            answer.compareAndupdate(summit: summit, idensity: maxIntensity[summit])
        }
    }
    
    return answer.toArray
}

fileprivate struct Graph {
    var data: [Int: [Int: Int]] = [:] // key: 노드, value: [key 노드와 연결된 노드: 가중치(비용)]
    let gates: Set<Int>
    let summits: Set<Int>
    
    init(gates: Set<Int>, summits: Set<Int>) {
        self.gates = gates
        self.summits = summits
    }
    
    mutating func insert(node1: Int, node2: Int, cost: Int) {
        // 게이트 검사
        if gates.contains(node1) {
            insertGate(gate: node1, node: node2, cost: cost)
        } else if gates.contains(node2) {
            insertGate(gate: node2, node: node1, cost: cost)
        }
        // 봉우리 검사
        else if summits.contains(node1) {
            insertSummit(summit: node1, node: node2, cost: cost)
        } else if summits.contains(node2) {
            insertSummit(summit: node2, node: node1, cost: cost)
        }
        // 둘 다 일반 노드
        else {
            insertBothway(node1: node1, node2: node2, cost: cost)
        }
    }
    
    mutating private func insertBothway(node1: Int, node2: Int, cost: Int) {
        self.data[node1, default: [:]].updateValue(cost, forKey: node2)
        self.data[node2, default: [:]].updateValue(cost, forKey: node1)
    }
    
    mutating private func insertGate(gate: Int, node: Int, cost: Int) {
        self.data[gate, default: [:]].updateValue(cost, forKey: node)
    }
    
    mutating private func insertSummit(summit: Int, node: Int, cost: Int) {
        self.data[node, default: [:]].updateValue(cost, forKey: summit)
    }
    
    func getAdjacentNodes(node: Int) -> [Int: Int] {
        return data[node, default: [:]]
    }
}

fileprivate struct Node: Comparable {
    let name: Int
    let cost: Int
    
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
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
