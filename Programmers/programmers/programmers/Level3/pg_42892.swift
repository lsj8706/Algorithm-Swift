//
//  pg_42892.swift
//  programmers
//
//  Created by sejin on 2023/08/07.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42892
//  길 찾기 게임

import Foundation

func solve42892() {
    print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))
}

fileprivate func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    // Binary Search Tree 문제
    
    var index = 0
    
    let nodeinfo: [[Int]] = nodeinfo.map {
        index += 1
        return $0 + [index]
    }.sorted {
        $0[1] > $1[1]   // y좌표를 내림차순으로 정렬해야 y좌표가 큰 노드가 트리의 상단에 위치하게 된다.
    }

    var bst = BinarySearchTree()
    
    for node in nodeinfo {
        let data = node[0]
        let name = node[2]
        
        bst.insert(name: name, data: data)
    }
    
    let preorderResult = bst.preorder()
    let postorderResult = bst.postorder()
    
    return [preorderResult, postorderResult]
}

fileprivate class Node {
    var name: Int   // nodeinfo의 인덱스에 1을 더한 값
    var data: Int   // x 좌표
    var left: Node?
    var right: Node?

    init(name: Int, data: Int, left: Node? = nil, right: Node? = nil) {
        self.name = name
        self.data = data
        self.left = left
        self.right = right
    }
}

fileprivate struct BinarySearchTree {
    private var root: Node?
    
    init() {}
    
    // O(logN)
    mutating func insert(name: Int, data: Int) {
        let newNode = Node(name: name, data: data)
        self.root = self.insert(from: root, newNode: newNode)
    }
    
    private mutating func insert(from node: Node?, newNode: Node) -> Node {
        guard let node = node else {
            return newNode
        }
        
        if newNode.data < node.data {
            node.left = insert(from: node.left, newNode: newNode)
        } else {
            node.right = insert(from: node.right, newNode: newNode)
        }
        
        return node
    }
    
    // O(N)
    func preorder() -> [Int] {
        var result = [Int]()
        self.preorder(node: self.root, result: &result)
        return result
    }
    
    private func preorder(node: Node?, result: inout [Int]) {
        guard let node = node else { return }
        result.append(node.name)
        preorder(node: node.left, result: &result)
        preorder(node: node.right, result: &result)
    }
    
    // O(N)
    func postorder() -> [Int] {
        var result = [Int]()
        self.postorder(node: self.root, result: &result)
        return result
    }
    
    private func postorder(node: Node?, result: inout [Int]) {
        guard let node = node else { return }
        postorder(node: node.left, result: &result)
        postorder(node: node.right, result: &result)
        result.append(node.name)
    }
}

// MARK: - BST 출력 (편의성을 위해 추가, 문제 풀이와 관련 X)

extension BinarySearchTree: CustomStringConvertible {
    var description: String {
        guard let root = self.root else {
            return "Empty Tree"
        }
        return diagram(for: root)
    }
    
    private func diagram(for node: Node?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.left == nil && node.right == nil {
            return root + "\(node.name)\n"
        }
        
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
        + root + "\(node.name)\n"
        + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

