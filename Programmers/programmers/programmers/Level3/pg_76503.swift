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
    
    let tree = graph.convertToTree()
    
    var result = 0
    var queue = [Int]()
    let leafNodes = tree.leafNodes
    queue.append(contentsOf: leafNodes)

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        guard let parent = tree.parent[cur] else { continue }
        result += abs(a[cur])
        a[parent] += a[cur]
        a[cur] = 0
        
        queue.append(parent)
    }
    
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
    
    func convertToTree() -> Tree {
        var leafAndRoot = findLeafAndRoot()
        let root = leafAndRoot.removeLast()
        var tree = Tree(root: root, leafNodes: leafAndRoot)
        
        var visited = Array(repeating: false, count: self.count)
        visited[root] = true
        
        var queue = [Int]()
        queue.append(root)
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let children = data[cur]!
            
            for child in children {
                if visited[child] == false {
                    visited[child] = true
                    tree.insert(parent: cur, children: child)
                    queue.append(child)
                }
            }
        }
        
        return tree
    }
    
    private func findLeafAndRoot() -> [Int] {
        var nodes = [Int]()
        
        for (key, value) in data {
            if value.count == 1 {
                nodes.append(key)
            }
        }
        
        return nodes
    }
}

fileprivate struct Tree {
    var children = [Int: [Int]]() // key: 부모, value: 자식 노드들
    var parent = [Int: Int]() // key: 자식, value: 부모 노드
    var root: Int
    var leafNodes: [Int]
    
    init(root: Int, leafNodes: [Int]) {
        self.root = root
        self.leafNodes = leafNodes
    }
    
    mutating func insert(parent: Int, children: Int) {
        self.children[parent, default: []].append(children)
        self.parent[children] = parent
    }
}

// a의 합이 0이면 모두 0으로 만들 수 있다.
// 리프 노드에서 로트 노드로 올림 -> 현재 노드가 0이 되면 스탑
// 주어진건 그래프 형태 => 이걸 트리로 변환
