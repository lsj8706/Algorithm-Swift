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
    //    print(solution([[1]], [0, 0], [0, 0]))
}

fileprivate func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    return dfs(ax: aloc[0], ay: aloc[1], bx: bloc[0], by: bloc[1], board: board, aTurn: true, totalCount: 0).moveCount
}

// 현재 이동 대상인 유저가 승리하면 MoveResult의 isWin이 true를 리턴
fileprivate func dfs(ax: Int, ay: Int, bx: Int, by: Int, board: [[Int]], aTurn: Bool, totalCount: Int) -> MoveResult {
    var board = board
    var winCount = board.count * board[0].count
    var loseCount = totalCount
    var willWin = false
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    if aTurn && board[ax][ay] == 1 { // a가 움직일 차례
        for i in 0..<4 {
            let nx = ax + dx[i]
            let ny = ay + dy[i]
            
            if !isInRange(x: nx, y: ny, board: board) || board[nx][ny] == 0 { continue }
            
            board[ax][ay] = 0
            
            let res = dfs(ax: nx, ay: ny, bx: bx, by: by, board: board, aTurn: false, totalCount: totalCount + 1)
            
            if willWin != true {
                willWin = !res.isWin
            }
            
            if res.isWin {
                loseCount = max(loseCount, res.moveCount)
            } else {
                winCount = min(winCount, res.moveCount)
            }
            
            board[ax][ay] = 1
        }
    }
    
    if !aTurn && board[bx][by] == 1 { // b가 움직일 차례
        for i in 0..<4 {
            let nx = bx + dx[i]
            let ny = by + dy[i]
            
            if !isInRange(x: nx, y: ny, board: board) || board[nx][ny] == 0 { continue }
            
            board[bx][by] = 0
            
            let res = dfs(ax: ax, ay: ay, bx: nx, by: ny, board: board, aTurn: true, totalCount: totalCount + 1)
            
            if willWin != true {
                willWin = !res.isWin
            }
            
            if res.isWin {
                loseCount = max(loseCount, res.moveCount)
            } else {
                winCount = min(winCount, res.moveCount)
            }
            
            board[bx][by] = 1
        }
    }
    
    return MoveResult(isWin: willWin, moveCount: willWin ? winCount : loseCount)
}

fileprivate struct MoveResult {
    let isWin: Bool
    let moveCount: Int
}

func isInRange(x: Int, y: Int, board: [[Int]]) -> Bool {
    return x>=0 && x<board.count && y>=0 && y<board[0].count
}
