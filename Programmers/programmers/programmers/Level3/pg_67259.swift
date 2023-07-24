//
//  pg_67259.swift
//  programmers
//
//  Created by sejin on 2023/07/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/67259
//  [카카오 인턴] 경주로 건설

import Foundation

func solve67259() {
    print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]))
    
//    print(solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]))
//    print(solution([[0,0,0],[0,0,0],[0,0,0]]))
}

fileprivate func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var result = Int.max
    
    func dfs(x: Int, y: Int, sum: Int, prevDirection: Direction) {
        if sum >= result {
            return
        }
        
        if x == n-1 && y == n-1 {
            result = min(result, sum)
            return
        }
        
        for i in 0..<4 {
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            
            if nextX >= 0 && nextX < n && nextY >= 0 && nextY < n && visited[nextY][nextX] == false && board[nextY][nextX] == 0 {
                
                visited[nextY][nextX] = true
                
                let isCorner = checkIsCorner(x: dx[i], prevDirection: prevDirection)
                
                let sum = isCorner ? sum + 600 : sum + 100
                let direction: Direction = dx[i] == 0 ? .vertical : .horizontal
                
                dfs(x: nextX, y: nextY, sum: sum, prevDirection: direction)
                visited[nextY][nextX] = false
            }
        }
    }
    
    dfs(x: 0, y: 0, sum: 0, prevDirection: .none)
        
    return result
}

fileprivate enum Direction {
    case vertical
    case horizontal
    case none
}

fileprivate func checkIsCorner(x: Int, prevDirection: Direction) -> Bool {
    if (x == 1 || x == -1) && prevDirection == .vertical {
        return true
    }
    
    if x == 0 && prevDirection == .horizontal {
        return true
    }
    
    return false
}
