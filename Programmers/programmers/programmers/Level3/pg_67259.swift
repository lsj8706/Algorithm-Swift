//
//  pg_67259.swift
//  programmers
//
//  Created by sejin on 2023/07/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/67259
//  [카카오 인턴] 경주로 건설

import Foundation
import SwiftDataStructure

func solve67259() {
    print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]))
    
//    print(solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]))
//    print(solution([[0,0,0],[0,0,0],[0,0,0]]))
}

fileprivate func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    var distance = Array(repeating: Array(repeating: Array(repeating: Int.max, count: n), count: n), count: 4) // 3차원 어레이 [방향][X][Y]
    
    func bfs() {
        var queue = Queue<Point>()
        
        // (0, 0)의 좌표를 동서남북 4개의 방향으로 갈 때의 초기값을 큐에 넣는다.
        for direction in 0..<4 {
            queue.enqueue(Point(x: 0, y: 0, cost: 0, direction: direction))
            distance[direction][0][0] = 0
        }
        
        while !queue.isEmpty {
            let current = queue.dequeue()!
            let x = current.x
            let y = current.y
            let prevDirection = current.direction
            
            for i in 0..<4 {
                let nextX = x + dx[i]
                let nextY = y + dy[i]
                
                // 이전 위치로 다시 돌아가는 경우는 제외시킴
                if nextX == x && nextY == y {
                    continue
                }
    
                if nextX >= 0 && nextX < n && nextY >= 0 && nextY < n && board[nextY][nextX] == 0 {
                    let isCorner = checkIsCorner(direction: i, prevDirection: prevDirection)
                    let nextCost = isCorner ? current.cost + 600 : current.cost + 100
                    
                    if distance[i][nextY][nextX] > nextCost {
                        distance[i][nextY][nextX] = nextCost
                        queue.enqueue(Point(x: nextX, y: nextY, cost: nextCost, direction: i))
                    }
                }
            }
        }
    }
    
    bfs()
    
    var result = Int.max

    // 동서남북의 방향 중에서 목적지까지의 최소 비용을 답으로 정한다.
    for i in 0..<4 {
        result = min(result, distance[i][n-1][n-1])
    }
    
    return result
}

fileprivate struct Point {
    let x: Int
    let y: Int
    let cost: Int
    let direction: Int
}

fileprivate func checkIsCorner(direction: Int, prevDirection: Int) -> Bool {
    return direction != prevDirection
}
