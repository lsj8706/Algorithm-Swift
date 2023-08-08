//
//  pg_81303.swift
//  programmers
//
//  Created by sejin on 2023/08/08.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/81303
//  표 편집

import Foundation

func solve81303() {
    print(solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]))
}

// 양방향 링크드 리스트
// 삭제한 아이템들을 스택에 넣는다.
fileprivate func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var linkedList = DoublyLinkedList()
    
    for i in 0..<n {
        linkedList.append(i)
    }
    
    // k 위치로 이동
    linkedList.moveCurrentNode(amount: k, isUp: false)
    
    for command in cmd {
        let cmdArr = command.split(separator: " ")
        switch cmdArr.first! {
        case "U":
            let amount = Int(cmdArr.last!)!
            linkedList.moveCurrentNode(amount: amount, isUp: true)
        case "D":
            let amount = Int(cmdArr.last!)!
            linkedList.moveCurrentNode(amount: amount, isUp: false)
        case "C":
            linkedList.removeCurrentNode()
        case "Z":
            linkedList.restore()
        default:
            break
        }
    }
    
    // 삭제한 노드들의 정보만 가져와서 X로 바꾼다.
    let removedData = linkedList.removedNodeStack.map { $0.data }
    
    var result = Array(repeating: "O", count: n)
    
    for i in removedData {
        result[i] = "X"
    }
    
    return result.joined()
}

fileprivate class Node {
    var data: Int
    var prev: Node? // up
    var next: Node? // down
    
    init(data: Int, prev: Node? = nil, next: Node? = nil) {
        self.data = data
        self.prev = prev
        self.next = next
    }
}

fileprivate struct DoublyLinkedList {
    var cur: Node?
    var tail: Node?
    var removedNodeStack = [Node]()
    
    init() {}
    
    /// O(1)
    mutating func append(_ data: Int) {
        let newNode = Node(data: data)
        
        if tail == nil {
            tail = newNode
            cur  = newNode
            return
        }
        
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
    }
    
    /// O(X)
    mutating func moveCurrentNode(amount: Int, isUp: Bool) {
        for _ in 0..<amount {
            guard let cur = cur else { return }
            if isUp {
                self.cur = cur.prev
            } else {
                self.cur = cur.next
            }
        }
    }
    
    /// O(1)
    mutating func removeCurrentNode() {
        cur?.prev?.next = cur?.next
        cur?.next?.prev = cur?.prev
        
        removedNodeStack.append(cur!)
        
        cur = cur?.next ?? cur?.prev
    }
    
    /// O(1)
    mutating func restore() {
        let removedNode = removedNodeStack.popLast()!
        
        removedNode.prev?.next = removedNode
        removedNode.next?.prev = removedNode
    }
}
