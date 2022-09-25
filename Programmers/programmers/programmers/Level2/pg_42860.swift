//
//  pg_42860.swift
//  programmers
//
//  Created by sejin on 2022/09/25.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42860
// 조이스틱

import Foundation

func solve42860() {
    print(solution("AAA"))
}

fileprivate func solution(_ name:String) -> Int {
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var position = 0
    var dict = [String: Int]()
    
    for alpha in alphabet {
        dict[alpha] = position
        position += 1
    }
    
    let name = Array(name).map{String($0)}
    var res = 9999
    
    func recursion(cnt: Int, idx: Int, now: [String], checked: Int) {
        if checked > name.count {
            return
        }
        
        if cnt >= res {
            return
        }
        
        if now == name {
            if cnt < res {
                res = cnt
                return
            }
        }
        
        var newCnt = cnt + 1
        var now = now

        if now[idx] != name[idx] {
            let move = getStickMoveCnt(name[idx], dict)
            newCnt += move
            now[idx] = name[idx]
        }
        
        recursion(cnt: newCnt, idx: (idx+1) % name.count, now: now, checked: checked + 1)

        var newIndex = idx-1
        if newIndex < 0 {
            newIndex = name.count - 1
        }
        
        recursion(cnt: newCnt, idx: newIndex, now: now, checked: checked + 1)
    }
    
    recursion(cnt: 0, idx: 0, now: Array(repeating: "A", count: name.count), checked: 0)
    
    return res == 0 ? res : res - 1
}

fileprivate func getStickMoveCnt(_ dest: String, _ dict: [String: Int]) -> Int {
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let moveFromA = dict[dest]!
    let moveFromZ = 1 + alphabet.count - (dict[dest]! + 1)
    let move = min(moveFromA, moveFromZ)
    
    return move
}
