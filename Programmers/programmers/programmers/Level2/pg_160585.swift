//
//  pg_160585.swift
//  programmers
//
//  Created by sejin on 2023/10/12.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/160585
//  혼자서 하는 틱택토

import Foundation

func solve160585() {
//    print(solution(["O.X", ".O.", "..X"]))
    print(solution(["OXO", "XOX", "OXO"]))
}

fileprivate func solution(_ board:[String]) -> Int {
    let board = board.map { Array($0).map { String($0) } }
    var oCnt = 0
    var xCnt = 0
    
    for row in board {
        for char in row {
            if char == "O" {
                oCnt += 1
            } else if char == "X" {
                xCnt += 1
            }
        }
    }
    
    if xCnt > oCnt {
        return 0
    }
    
    if oCnt - xCnt > 1 {
        return 0
    }
    
    var oBingoCnt = 0
    var xBingoCnt = 0
    
    func countBingo(target: [String]) {
        if isOBingo(target: target) {
            oBingoCnt += 1
        }
        
        if isXBingo(target: target) {
            xBingoCnt += 1
        }
    }
    
    for row in board {
        countBingo(target: row)
    }
    
    // 대각선 확인
    var diagonal1 = [String]()
    var diagonal2 = [String]()
    
    for x in 0..<3 {
        // 세로줄 확인
        var col = [String]()
        for y in 0..<3 {
            col.append(board[y][x])
        }
        
        countBingo(target: col)
        

        diagonal1.append(board[x][x])
        diagonal2.append(board[x][2-x])
    }
    
    countBingo(target: diagonal1)
    countBingo(target: diagonal2)
    
    if oBingoCnt >= 1 && xBingoCnt >= 1 {
        return 0
    }
    
    if oBingoCnt >= 1 {
        if oCnt - xCnt != 1 {
            return 0
        }
    }
    
    if xBingoCnt >= 1 {
        if oCnt - xCnt != 0 {
            return 0
        }
    }
    
    return 1
}

fileprivate func isOBingo(target: [String]) -> Bool {
    return target == ["O", "O", "O"]
}

fileprivate func isXBingo(target: [String]) -> Bool {
    return target == ["X", "X", "X"]
}





// O의 개수는 X의 개수보다 같거나 1개 많아야 함
// O와 X의 동시 승리 불가
// O가 이겼다면 O의 개수가 X보다 1개 더 많아야 함
// X가 이겼다면 X의 개수가 O보다 1개 더 많아야 함
