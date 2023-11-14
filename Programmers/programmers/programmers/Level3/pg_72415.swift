//
//  pg_72415.swift
//  programmers
//
//  Created by sejin on 2023/11/14.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/72415
//  카드 짝 맞추기

import Foundation

func solve72415() {
    print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))
//    print(solution([[1,0,0,3],[0,0,0,0],[0,0,0,2],[3,0,1,0]], 1, 0))
    }

fileprivate func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    var result = Int.max
    var enterCnt = 0
    
    for row in board {
        for item in row {
            if item != 0 {
                enterCnt += 1
            }
        }
    }
    
    func dfs(now: [[Int]], x: Int, y: Int, cnt: Int, entered: Int) {
        // base case: 전부 0이 된 상태 (모든 카드 확인 완료)
        if now.allSatisfy({ $0.reduce(0, +) == 0 }) {
            result = min(result, cnt)
            return
        }
        
        // entered가 있다면 곧바로 해당 카드를 찾아가기
        if entered != 0 {
            let res = bfs(board: now, x: x, y: y, target: entered)
            var temp = now
            temp[res.x][res.y] = 0
            dfs(now: temp, x: res.x, y: res.y, cnt: cnt + res.cnt, entered: 0)
        } else {
            // entered가 없다면 남아 있는 카드를 구하고 반복문을 돌며 해당 카드로 이동
            var cards = Set<Int>()
            for row in now {
                for item in row {
                    if item != 0 {
                        cards.insert(item)
                    }
                }
            }
            
            for card in cards {
                let res = bfs(board: now, x: x, y: y, target: card)
                var temp = now
                temp[res.x][res.y] = 0
                dfs(now: temp, x: res.x, y: res.y, cnt: cnt + res.cnt, entered: card)
            }
        }
    }
    
    dfs(now: board, x: r, y: c, cnt: 0, entered: 0)
    
    // 엔터 횟수는 최초부터 정해져 있음 (카드의 수)
    return result + enterCnt
}

// 특정 위치까지의 최단 경로 찾기, 걸린 횟수와 위치 리턴
fileprivate func bfs(board: [[Int]], x: Int, y: Int, target: Int) -> (x: Int, y: Int, cnt: Int) {
    var q = [(x: Int, y: Int, cnt: Int)]()
    var visited = Array(repeating: Array(repeating: false, count: 4), count: 4)
    
    q.append((x, y, 0))
    visited[x][y] = true
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    while !q.isEmpty {
        let now = q.removeFirst()
        let curX = now.x
        let curY = now.y

        if board[curX][curY] == target {
            return (curX, curY, now.cnt)
        }
        
        // 4 방향
        for i in 0..<4 {
            let nx = curX + dx[i]
            let ny = curY + dy[i]
            
            if isInBoardSize(x: nx, y: ny) {
                if visited[nx][ny] == false {
                    q.append((nx, ny, now.cnt+1))
                    visited[nx][ny] = true
                }
            }
        }
        
        // ctrl
        for i in 0..<4 {
            var tempX = curX
            var tempY = curY
            
            while isInBoardSize(x: tempX+dx[i], y: tempY+dy[i]) {
                tempX += dx[i]
                tempY += dy[i]
                
                if board[tempX][tempY] != 0 {
                    break
                }
            }
            
            if visited[tempX][tempY] == false {
                q.append((tempX, tempY, now.cnt+1))
                visited[tempX][tempY] = true
            }
        }
    }
    
    return (0,0,0)
}

fileprivate func isInBoardSize(x: Int, y: Int) -> Bool {
    return x >= 0 && x < 4 && y >= 0 && y < 4
}
