//
//  Q_22.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/13.
//
// page 355
// 블록 이동하기
// https://school.programmers.co.kr/learn/courses/30/lessons/60063

import Foundation

func solveQ_22() {
    print(solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]))
}

fileprivate func solution(_ board:[[Int]]) -> Int {
    var res = Int.max
    var size = board.count - 1
    var visited = [[(x: Int, y: Int)]]()
    
    func dfs(loc: [(x: Int, y: Int)], time: Int) {
        if (loc[0].x == size && loc[0].y == size) || (loc[1].x == size && loc[1].y == size) {
            res = min(res, time)
            return
        }
        
        
        
    }
    
    return 0
}
