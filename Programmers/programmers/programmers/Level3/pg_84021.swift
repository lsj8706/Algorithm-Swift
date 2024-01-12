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
    var visited = Array(repeating: Array(repeating: false, count: table[0].count), count: table.count)
    var figures = [[Coord]]() // 각 도형들은 좌상단으로 옮겨서 저장
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    func bfs(x: Int, y: Int) {
        var result = [(Int, Int)]()
        var queue = [(Int, Int)]()
        
        queue.append((x, y))
        
        while !queue.isEmpty {
            let now = queue.removeFirst()
            result.append(now)
            
            for i in 0..<4 {
                let nextX = now.0 + dx[i]
                let nextY = now.1 + dy[i]
                
                if nextX >= 0 && nextX < table.count && nextY >= 0 && nextY < table[0].count {
                    if visited[nextX][nextY] == false && table[nextX][nextY] == 1 {
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
    

    for x in table.indices {
        for y in table[0].indices {
            if visited[x][y] == false && table[x][y] == 1 {
                visited[x][y] = true
                bfs(x: x, y: y)
            }
        }
    }
    
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

    var result = 0
    outer: for blank in blanks {
        for (index, figure) in figures.enumerated() {
            if figure.count != blank.count { continue }
            var prev = figure
            for _ in 0..<4 {
                // 회전시키며 검사
                let rotated = rotate(arr: prev)
                prev = rotated
                if rotated.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) == blank.sorted(by: { ($0.x, $0.y) < ($1.x, $1.y) }) {
                    figures.remove(at: index)
                    result += blank.count
                    continue outer
                }
            }
        }
    }
    
    return result
}

fileprivate func rotate(arr: [Coord]) -> [Coord] {
    let maxX = arr.max(by: { $0.x < $1.x })!.x
    
    return arr.map { Coord(x: $0.y, y: maxX-$0.x) }
}

fileprivate struct Coord: Equatable, CustomStringConvertible {
    var description: String {
        return "\(x) \(y)"
    }
    
    let x: Int
    let y: Int
}
