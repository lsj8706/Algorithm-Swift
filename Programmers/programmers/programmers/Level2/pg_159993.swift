//
//  pg_159993.swift
//  programmers
//
//  Created by sejin on 2023/06/29.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/159993
//  미로 탈출

import Foundation

func solve159993() {
    print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))
}

fileprivate func solution(_ maps:[String]) -> Int {
    let maps = maps.map { Array($0).map { String($0) } }
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    let visited1 = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    let visited2 = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    
    func bfs(x: Int, y: Int, target: String, visited: [[Bool]]) -> Int {
        var visited = visited
        var cnt = 0
        
        var q = DoubleStackQueue<(Int, Int)>()
        q.enqueue((x,y))
        
        while !q.isEmpty {
            for _ in 0..<q.count { // 큐에 들어있는 좌표들의 개수만큼 반복문을 돌고 cnt를 1 증가시킨다. (그래야 한 레벨의 노드를 전부 처리하고 cnt를 증가시킬 수 있다.)
                let first = q.dequeue()!
                let x = first.0
                let y = first.1

                if maps[x][y] == target {
                    return cnt
                }
                
                var canMove = false

                for i in 0..<4 {
                    let nextX = x + dx[i]
                    let nextY = y + dy[i]
        
                    if maps.indices ~= nextX && maps[0].indices ~= nextY && maps[nextX][nextY] != "X" {
                        canMove = true
                        if visited[nextX][nextY] == false {
                            visited[x][y] = true
                            q.enqueue((nextX, nextY))
                        }
                    }
                }
                
                if canMove == false {
                    return -1
                }
            }
            
            cnt += 1
        }
        
        return cnt
    }
    
    var startCoor: (x: Int, y: Int) = (0, 0)
    var leverCoor: (x: Int, y: Int) = (0, 0)
    
    for x in maps.indices {
        for y in maps[0].indices {
            if maps[x][y] == "S" {
                startCoor = (x, y)
            }
            
            if maps[x][y] == "L" {
                leverCoor = (x, y)
            }
        }
    }
    
    
    let cntToLever = bfs(x: startCoor.x, y: startCoor.y, target: "L", visited: visited1)
    if cntToLever == -1 { return -1 }
    let cntToEnd = bfs(x: leverCoor.x, y: leverCoor.y, target: "E", visited: visited2)
    if cntToEnd == -1 { return -1 }
    
    return cntToLever + cntToEnd
}
