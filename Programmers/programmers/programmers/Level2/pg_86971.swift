//
//  pg_86971.swift
//  programmers
//
//  Created by sejin on 2023/06/06.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/86971
//  전략망을 둘로 나누기

import Foundation

func solve86971() {
    print(solution(3, [[1,2], [2, 3]]))
}

fileprivate func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max
    var map = [Int: [Int]]()
    let totalNodesCnt = n
    
    for wire in wires {
        var arr = map[wire[0], default: []]
        map[wire[0]] = arr + [wire[1]]
        
        arr = map[wire[1], default: []]
        map[wire[1]] = arr + [wire[0]]
    }
    
    // 하나씩 연결을 끊으면서 완전 탐색
    for wire in wires {
        var temp = map
        temp[wire[0]] = temp[wire[0], default: []].filter{ $0 != wire[1] }
        temp[wire[1]] = temp[wire[1], default: []].filter{ $0 != wire[0] }
        // 연결된 노드 개수 구하기 (한쪽 뭉치의 개수만 구하면 다른 쪽은 자동으로 계산 됨)
        let cnt = getNodesCnt(map: temp)
        let otherSideCnt = totalNodesCnt - cnt
        result = min(result, abs(cnt - otherSideCnt))
    }
    
    return result
}

fileprivate func getNodesCnt(map: [Int: [Int]]) -> Int {
    var cnt = 1
    let firstNode = map.keys.first!
    var queue: [Int] = [firstNode]
    var ch = Array(repeating: false, count: 100)
    ch[firstNode] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let arr = map[node, default: []]

        for newNode in arr {
            if ch[newNode] { continue }
            ch[newNode] = true
            queue.append(newNode)
            cnt += 1
        }
    }
    
    return cnt
}
