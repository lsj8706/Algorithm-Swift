//
//  pg_76503.swift
//  programmers
//
//  Created by sejin on 2023/09/06.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/76503
//  모두 0으로 만들기

import Foundation

func solve76503() {
    print(solution([-5,0,2,1,2], [[0,1],[3,4],[2,3],[0,3]]))
}

fileprivate func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    let sum = a.reduce(0, +)
    guard sum == 0 else { return -1 }
    
    var a = a
    
    var graph = Graph(count: a.count)
    
    for edge in edges {
        graph.insertEdge(with: edge)
    }
        
    var result = 0
    let root = graph.findRoot()
    var visited = Array(repeating: false, count: a.count)
    
    var parentDict = [Int: Int]() // key: 자식 노드, value: 부모 노드
    
    func dfs(cur: Int) {
        visited[cur] = true
        
        // leaf 노드까지 쭉 내려감
        if let children = graph.data[cur] {
            for child in children {
                if !visited[child] {    // 부모 노드를 재방문하는 것 방지
                    parentDict[child] = cur
                    dfs(cur: child)
                }
            }
        }

        if cur == root {
            // cur이 루트인 경우
            result += abs(a[cur])
            return
        }
        
        let parent = parentDict[cur]!
        
        a[parent] += a[cur]
        result += abs(a[cur])
    }

    dfs(cur: root)
    
    return Int64(result)
}

fileprivate struct Graph {
    var data = [Int: [Int]]()
    let count: Int
    
    init(count: Int) {
        self.count = count
        for i in 0..<count {
            data[i] = []
        }
    }
    
    mutating func insertEdge(with edge: [Int]) {
        data[edge[0]]!.append(edge[1])
        data[edge[1]]!.append(edge[0])
    }
    
    func findRoot() -> Int {
        for (key, value) in data {
            if value.count == 1 {
                return key
            }
        }
        
        return 0  // 여긴 실행 X
    }
}


// a의 합이 0이면 모두 0으로 만들 수 있다.
// 리프 노드에서 로트 노드로 올림 -> 현재 노드가 0이 되면 스탑
// 주어진건 그래프 형태 => 이걸 트리로 변환
