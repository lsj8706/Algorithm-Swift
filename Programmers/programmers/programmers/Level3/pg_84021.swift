//
//  pg_84021.swift
//  programmers
//
//  Created by sejin on 1/12/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/84021
//  퍼즐 조각 채우기

import Foundation

func solve84021() {
    print(solution([[1,1,0,0,1,0],[0,0,1,0,1,0],[0,1,1,0,0,1],[1,1,0,1,1,1],[1,0,0,0,1,0],[0,1,1,1,0,0]], [[1,0,0,1,1,0],[1,0,1,0,1,0],[0,1,1,0,1,1],[0,0,1,0,0,0],[1,1,0,1,1,0],[0,1,0,0,0,0]]))
}

fileprivate func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    
    // 도형 찾기 (bfs)
    var visited = [[Bool]]()
    var figures = [[Coord]]() // 각 도형들은 좌상단으로 옮겨서 저장
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    func bfs(x: Int, y: Int, rotatedTable: [[Int]]) {
        var result = [(Int, Int)]()
        var queue = [(Int, Int)]()
        
        queue.append((x, y))
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            result.append(now)
            
            for i in 0..<4 {
                let nextX = now.0 + dx[i]
                let nextY = now.1 + dy[i]
                
                if nextX >= 0 && nextX < rotatedTable.count && nextY >= 0 && nextY < rotatedTable[0].count {
                    if visited[nextX][nextY] == false && rotatedTable[nextX][nextY] == 1 {
                        visited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    }
                }
            }
        }
        
        let minX = result.sorted(by: { $0.0 < $1.0 })[0].0
        let minY = result.sorted(by: { $0.1 < $1.1 })[0].1
        
        figures.append(result.map { Coord(x: $0.0-minX, y: $0.1-minY) })
    }
    
    var prevTable = table
    // 4번 회전시켜서 생길 수 있는 모형 전부 검출
    for _ in 0..<4 {
        let rotatedTable = rotateArray(prevTable)
        prevTable = rotatedTable
        visited = Array(repeating: Array(repeating: false, count: rotatedTable[0].count), count: rotatedTable.count)
        
        for x in rotatedTable.indices {
            for y in rotatedTable[0].indices {
                if visited[x][y] == false && rotatedTable[x][y] == 1 {
                    visited[x][y] = true
                    bfs(x: x, y: y, rotatedTable: rotatedTable)
                }
            }
        }
    }
    
    // 이제 figures에 도형들 묶음이 다 들어있음 (회전 포함)
    var boardVisited = Array(repeating: Array(repeating: false, count: game_board[0].count), count: game_board.count)
    var blanks = [[Coord]]()
    
    func findBlank(x: Int, y: Int) {
        var result = [(Int, Int)]()
        var queue = [(Int, Int)]()
        
        queue.append((x, y))
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            result.append(now)
            
            for i in 0..<4 {
                let nextX = now.0 + dx[i]
                let nextY = now.1 + dy[i]
                
                if nextX >= 0 && nextX < game_board.count && nextY >= 0 && nextY < game_board[0].count {
                    if boardVisited[nextX][nextY] == false && game_board[nextX][nextY] == 0 {
                        boardVisited[nextX][nextY] = true
                        queue.append((nextX, nextY))
                    }
                }
            }
        }
        
        let minX = result.sorted(by: { $0.0 < $1.0 })[0].0
        let minY = result.sorted(by: { $0.1 < $1.1 })[0].1
        
        blanks.append(result.map { Coord(x: $0.0-minX, y: $0.1-minY) })
    }
    
    for x in game_board.indices {
        for y in game_board[0].indices {
            if boardVisited[x][y] == false && game_board[x][y] == 0 {
                boardVisited[x][y] = true
                findBlank(x: x, y: y)
            }
        }
    }
    
//    print(blanks.map { $0.map { "\($0.x) \($0.y)" } })
    print(figures.map { $0.map { "\($0.x) \($0.y)" } }.filter { $0.count == 5 })
    
    var result = 0
    for blank in blanks {
        if figures.contains(where: { $0 == blank }) {
            result += blank.count
            // 회전으로 발생하는 도형 지우기
        }
    }
    
    return result
}

// 90도 회전
fileprivate func rotateArray(_ arr: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: arr.count), count: arr[0].count)
    
    for x in arr.indices {
        for y in arr[0].indices {
            result[y][arr.count-1-x] = arr[x][y]
        }
    }
    
    return result
}

fileprivate struct Coord: Equatable {
    let x: Int
    let y: Int
}
