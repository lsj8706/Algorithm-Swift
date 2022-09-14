//
//  pg_17679.swift
//  programmers
//
//  Created by sejin on 2022/09/14.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17679
// 프렌즈4블록

import Foundation

func solve17679() {
    print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
}

fileprivate func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var cnt = 0
    var board = board.map({ Array($0) })
    let dx = [0, 1, 0, 1]
    let dy = [0, 0, 1, 1]
    
    while true {
        var positions = [(Int,Int)]()

        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let target = board[i][j]
                if target == "X" {
                    continue
                }
                if target == board[i][j+1] && target == board[i+1][j] && target == board[i+1][j+1] {
                    positions.append((i,j))
                }
            }
        }
        
        if positions.count == 0 {
            break
        } else {
            for position in positions {
                let y = position.0
                let x = position.1
                
                for i in 0..<dy.count {
                    if board[y+dy[i]][x+dx[i]] != "X" {
                        board[y+dy[i]][x+dx[i]] = "X"
                        cnt += 1
                    }
                }
            }
        }
        
        // 지워진 부분의 위쪽을 내리기
        for j in 0..<n {
            for i in 0..<m {
                if board[i][j] == "X" {
                    for k in stride(from: i, through: 0, by: -1) {
                        if k > 0 {
                            let temp = board[k-1][j]
                            board[k-1][j] = board[k][j]
                            board[k][j] = temp
                        }
                    }
                }
            }
        }
    }
    
    return cnt
}
