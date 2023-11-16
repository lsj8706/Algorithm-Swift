//
//  pg_72412.swift
//  programmers
//
//  Created by sejin on 2023/11/16.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/72412
//  순위 검색

import Foundation

func solve72412() {
    print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
}

fileprivate func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    let tree = InfoTree()
    
    for i in info {
        tree.insertNode(info: i)
    }
    
    tree.sortLeaves(node: tree.root)
    
    var result = [Int]()
    
    for q in query {
        result.append(tree.getCount(query: q))
    }
    
    return result
}

fileprivate class InfoNode {
    let name: String
    var score: Int = -1
    var children = [InfoNode]()
    var scores = [Int]()
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    
    func findChild(name: String) -> InfoNode? {
        return children.first(where:  { $0.name == name })
    }
    
    func addChild(node: InfoNode) {
        self.children.append(node)
    }
    
    func addScore(_ score: Int) {
        self.scores.append(score)
    }
    
    func getCount(score: Int) -> Int {
        var start = 0
        var end = scores.count - 1

        while start <= end {
            let mid = (start + end) / 2
            
            if scores[mid] >= score {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
                    
        return max(scores.count - start, 0)
    }
}

fileprivate class InfoTree {
    let root = InfoNode(name: "root", score: -1)
    
    func insertNode(info: String) {
        var info = info.components(separatedBy: " ")
        var cur = root
        
        while !info.isEmpty {
            let first = info.removeFirst()
            
            // 점수인 경우
            if info.isEmpty {
                cur.addScore(Int(first)!)
                return
            }
            
            if let child = cur.findChild(name: first) {
                cur = child
            } else {
                let child = makeNode(first)
                cur.addChild(node: child)
                cur = child
            }
        }
    }
    
    private func makeNode(_ name: String) -> InfoNode {
        InfoNode(name: name, score: -1)
    }
    
    func getCount(query: String) -> Int {
        var result = 0
        
        let query = query.components(separatedBy: " ").filter({ $0 != "and" })
        
        
        func dfs(query: [String], cur: InfoNode) {
            var query = query
            if query.isEmpty {
                return
            }
            
            let name = query.removeFirst()
            
            if query.isEmpty { // 점수 노드
                let score = Int(name)!
                result += cur.getCount(score: score)
                return
            }
            
            if name == "-" {
                for child in cur.children {
                    dfs(query: query, cur: child)
                }
            } else {
                if let next = cur.findChild(name: name) {
                    dfs(query: query, cur: next)
                }
            }
        }
        
        dfs(query: query, cur: root)
        
        return result
    }
    
    func sortLeaves(node: InfoNode) {
        if node.children.isEmpty && node.scores.isEmpty {
            return
        }
        
        if !node.scores.isEmpty {
            node.scores.sort()
            return
        } else {
            for child in node.children {
                sortLeaves(node: child)
            }
        }
    }
}
