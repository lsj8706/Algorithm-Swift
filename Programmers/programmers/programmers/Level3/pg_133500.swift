//
//  pg_133500.swift
//  programmers
//
//  Created by sejin on 2023/11/21.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/133500
//  등대

import Foundation

func solve133500() {
    print(solution(8, [[1, 2], [1, 3], [1, 4], [1, 5], [5, 6], [5, 7], [5, 8]]))
//    print(solution(10, [[4, 1], [5, 1], [5, 6], [7, 6], [1, 2], [1, 3], [6, 8], [2, 9], [9, 10]]))
}

fileprivate func solution(_ n:Int, _ lighthouse:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    
    for edge in lighthouse {
        graph[edge[0], default: []].append(edge[1])
        graph[edge[1], default: []].append(edge[0])
    }
    
    var light = Array(repeating: false, count: n+1)
    var result = 0
    
    func dfs(node: Int, parent: Int) {
        let children = graph[node, default: []]
        
        for child in children {
            if child == parent {
                continue
            }
            
            dfs(node: child, parent: node)
            
            if light[child] == false && light[node] == false {
                light[node] = true
                result += 1
            }
        }
    }
    
    dfs(node: 1, parent: 1)

    return result
}
