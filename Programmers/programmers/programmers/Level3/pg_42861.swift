//
//  pg_42861.swift
//  programmers
//
//  Created by sejin on 2023/07/18.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42861
//  섬 연결하기

import Foundation

func solve42861() {
    print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))
}

// 크루스칼 알고리즘 (최소 신장 트리 생성), 유니온 파인드 필요

fileprivate func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    // 간선을 오름차순으로 정렬
    let costs = costs.sorted {
        $0[2] < $1[2]
    }
    
    var result = 0
    var parent = [Int]()
    
    // 자기 자신을 부모 노드로 설정하여 parent 배열 초기화
    for i in 0..<n {
        parent.append(i)
    }
    
    for cost in costs {
        let node1 = cost[0]
        let node2 = cost[1]
        // 두 노드가 속한 집합(그래프)이 다를 때 연결 가능 (같은 집합에 속한다면 사이클이 발생!)
        if find(&parent, node1) != find(&parent, node2) {
            union(&parent, node1, node2) // 연결
            result += cost[2]
        }
    }
    
    return result
}


// 유니온 파인드

/// 부모 노드를 찾는다.
fileprivate func find(_ parent: inout [Int], _ index: Int) -> Int {
    if parent[index] == index {
        return index
    }
    
    parent[index] = find(&parent, parent[index])
    return parent[index]
}

/// 두 노드가 속한 집합을 합친다. => 하나의 그래프로 만든다. (두 노드의 부모 노드끼리 연결하면 결국 두 집합을 합치는 꼴이 된다.)
fileprivate func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let parentOfA = find(&parent, a)
    let parentOfB = find(&parent, b)
    
    if a < b {
        parent[parentOfB] = parentOfA
    } else {
        parent[parentOfA] = parentOfB
    }
}

