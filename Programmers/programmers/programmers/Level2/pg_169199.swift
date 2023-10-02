//
//  pg_169199.swift
//  programmers
//
//  Created by sejin on 2023/10/02.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/169199
//  리코쳇 로봇

import Foundation

func solve169199() {
    print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))
}

fileprivate func solution(_ board:[String]) -> Int {
    let board = board.map { Array($0).map { String($0) } }
    
    var start = (0, 0)
    var end = (0, 0)
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == "R" {
                start = (i, j)
            }
            
            if board[i][j] == "G" {
                end = (i, j)
            }
        }
    }
    
    let directions = Direction.allCases
    
    var dis = Array(repeating: Array(repeating: -1, count: board[0].count), count: board.count)
    
    var q = [Coord]()
    q.append(start)
    dis[start.0][start.1] = 0
    
    while !q.isEmpty {
        let cur = q.removeFirst()
        
        if cur == end {
            break
        }
        
        for dir in directions {
            let next = moveUntilBumped(direction: dir, cur: cur, board: board)
            if dis[next.0][next.1] == -1 {
                dis[next.0][next.1] = dis[cur.0][cur.1] + 1
                q.append(next)
            }
        }
    }
    
    return dis[end.0][end.1]
}

fileprivate enum Direction: CaseIterable {
    case top
    case bottom
    case left
    case right
    
    var dx: Int {
        switch self {
        case .top:
            return -1
        case .bottom:
            return 1
        case .left, .right:
            return 0
        }
    }
    
    var dy: Int {
        switch self {
        case .top, .bottom:
            return 0
        case .left:
            return -1
        case .right:
            return 1
        }
    }
}

fileprivate typealias Coord = (x: Int, y: Int)

fileprivate func moveUntilBumped(direction: Direction, cur: Coord, board: [[String]]) -> Coord {
    let dx = direction.dx
    let dy = direction.dy
    
    var x = cur.x
    var y = cur.y

    while x >= 0 && x < board.count && y >= 0 && y < board[0].count {
        var nx = x + dx
        var ny = y + dy
        
        if nx < 0 || nx >= board.count || ny < 0 || ny >= board[0].count {
            break
        }
        
        if board[nx][ny] == "D" { break }
        
        x = nx
        y = ny
    }
    
    return (x, y)
}
