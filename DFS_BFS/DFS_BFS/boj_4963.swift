//
//  main.swift
//  DFS_BFS
//
//  Created by User on 2022/06/20.
//
// https://www.acmicpc.net/problem/4963
// 섬의 개수

import Foundation

while true {

    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    if input == [0, 0] {
        break
    }
    
    let w = input[0]
    let h = input[1]

    
    var map = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    let dx: [Int] = [0,0,-1,1,-1,1,-1,1]
    let dy: [Int] = [-1,1,0,0,-1,-1,1,1]
    
    for _ in 0..<h {
        map.append(readLine()!.split(separator: " ").map({ Int($0)! }))
    }
    
    
    func DFS(x: Int, y: Int) {
        for i in 0..<dx.count {
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            if nextX < w && nextX >= 0 && nextY < h && nextY >= 0 && !visited[nextY][nextX] && map[nextY][nextX] == 1{
                visited[nextY][nextX] = true
                DFS(x: nextX, y: nextY)
            }
        }
    }
    
    var cnt = 0
    
    for i in 0..<h {
        for j in 0..<w {
            if map[i][j] == 1 && !visited[i][j] {
                visited[i][j] = true
                cnt += 1
                DFS(x: j, y: i)
            }
        }
    }
    
    print(cnt)
}

