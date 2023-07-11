//
//  pg_154540.swift
//  programmers
//
//  Created by sejin on 2023/05/29.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/154540
//  무인도 여행

import Foundation
import SwiftDataStructure

func solve154540() {
    print(solution(["X591X","X1X5X","X231X", "1XXX1"]))
}

fileprivate func solution(_ maps:[String]) -> [Int] {
    let maps = maps.map { Array($0) }
    
    var result = [Int]()
    
    var ch = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    
    func bfs(x: Int, y: Int) {
        var total = 0 // 식량 수 합
        var queue = DoubleStackQueue<(Int, Int)>()
        queue.enqueue((x,y))
        
        while !queue.isEmpty {
            let temp = queue.dequeue()!
            let (x, y) = temp
            
            if ch[x][y] {
                continue
            }
            ch[x][y] = true
            
            let info = maps[x][y]
            if info.isNumber {
                total += Int(String(info))!
                
                for k in 0..<dx.count {
                    let nextX = x + dx[k]
                    let nextY = y + dy[k]
                    
                    if nextX>=0 && nextX < maps.count && nextY >= 0 && nextY < maps[0].count {
                        queue.enqueue((nextX,nextY))
                    }
                }
            }
        }
        
        if total != 0 {
            result.append(total)
        }
    }
    
    for i in 0..<maps.count {
        for j in 0..<maps[0].count {
            if ch[i][j] == false {
                bfs(x: i, y: j)
            }
        }
    }
    
    if result.isEmpty {
        return [-1]
    }
    
    return result.isEmpty ? [-1] : result.sorted()
}
