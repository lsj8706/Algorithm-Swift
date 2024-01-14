//
//  pg_92345.swift
//  programmers
//
//  Created by sejin on 1/14/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/92345
//  사라지는 발판

import Foundation

func solve92345() {
    print(solution([[1, 1, 1], [1, 1, 1], [1, 1, 1]], [1, 0], [1, 2]))
//    print(solution([[1, 1, 1], [1, 0, 1], [1, 1, 1]], [1, 0], [1, 2]))
//    print(solution([[1, 1, 1, 1, 1]], [0, 0], [0, 4]))
    print(solution([[1]], [0, 0], [0, 0]))
}

fileprivate func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    var result = 0
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    func dfs(a: [Int], b: [Int], now: [[Int]], count: Int, aTurn: Bool) {
        result = max(result, count)

        if a == b { return }
        
        if aTurn { // a가 움직여야 하는 턴
            for i in 0..<4 {
                let nx = a[0] + dx[i]
                let ny = a[1] + dy[i]
                
                if isInRange(x: nx, y: ny) && now[nx][ny] == 1 {
                    var temp = now
                    temp[a[0]][a[1]] = 0
                    dfs(a: [nx, ny], b: b, now: temp, count: count+1, aTurn: false)
                }
            }
        } else { // b가 움직여야 하는 턴
            for i in 0..<4 {
                let nx = b[0] + dx[i]
                let ny = b[1] + dy[i]
                
                if isInRange(x: nx, y: ny) && now[nx][ny] == 1 {
                    var temp = now
                    temp[b[0]][b[1]] = 0
                    dfs(a: a, b: [nx, ny], now: temp, count: count+1, aTurn: true)
                }
            }
        }
    }
    
    func isInRange(x: Int, y: Int) -> Bool {
        return x>=0 && x<board.count && y>=0 && y<board[0].count
    }
    
    dfs(a: aloc, b: bloc, now: board, count: 0, aTurn: true)
    
    return result
}
