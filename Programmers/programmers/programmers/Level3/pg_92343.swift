//
//  pg_92343.swift
//  programmers
//
//  Created by sejin on 2023/08/16.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/92343
//  양과 늑대

import Foundation

func solve92343() {
    print(solution([0,0,1,1,1,0,1,0,1,0,1,1], [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))
}

fileprivate func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var tree = [Int: [Int]]()
    
    for edge in edges {
        tree[edge[0], default: []].append(edge[1])
    }
    
    func isSheep(_ node: Int) -> Bool {
        return info[node] == 0
    }

    var result = 0
    
    func dfs(cur: Int, sheepCnt: Int, wolfCnt: Int, possibleNodes: [Int]) {
        var sheepCnt = sheepCnt
        var wolfCnt = wolfCnt
        var possibleNodes = possibleNodes
 
        if isSheep(cur) {
            sheepCnt += 1
        } else {
            wolfCnt += 1
        }
        
        if wolfCnt >= sheepCnt {
            return
        }
        
        result = max(result, sheepCnt)
        
        let children = tree[cur, default: []]
        possibleNodes.append(contentsOf: children)
        
        for node in possibleNodes {
            dfs(cur: node, sheepCnt: sheepCnt, wolfCnt: wolfCnt, possibleNodes: possibleNodes.filter { $0 != node })
        }
    }
    
    dfs(cur: 0, sheepCnt: 0, wolfCnt: 0, possibleNodes: [])
    
    return result
}
