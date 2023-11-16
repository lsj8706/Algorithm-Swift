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
    
    func getCount(score: Int) -> Int {
        var cnt = 0
        
        for child in children {
            if child.score >= score {
                cnt += 1
            }
        }
        
        return cnt
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
                let child = makeScoreNode(Int(first)!)
                cur.addChild(node: child)
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
    
    private func makeScoreNode(_ score: Int) -> InfoNode {
        InfoNode(name: "", score: score)
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
}
