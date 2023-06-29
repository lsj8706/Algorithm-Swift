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
    print(solution(["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]))
}

fileprivate func solution(_ maps:[String]) -> Int {
    var mapArr: [[Character]] = []
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    var startCoord: (x: Int, y: Int) = (0, 0)
    var leverCoord: (x: Int, y: Int) = (0, 0)
    
    for (i, low) in maps.enumerated() {
        if let j = Array(low).firstIndex(of: "S") {
            startCoord = (i, j)
        }
        if let j = Array(low).firstIndex(of: "L") {
            leverCoord = (i, j)
        }
        mapArr.append(Array(low))
    }
    
    func bfs(x: Int, y: Int, target: Character) -> Int? {
        var distance = Array(repeating: Array(repeating: -1, count: maps[0].count), count: maps.count)
        
        var q = [(Int, Int)]()
        q.append((x,y))
        distance[x][y] = 0
        
        while !q.isEmpty {
            let (cx, cy) = q.removeFirst()

            if mapArr[cx][cy] == target {
                return distance[cx][cy]
            }
            
            for i in 0..<4 {
                let nextX = cx + dx[i]
                let nextY = cy + dy[i]
    
                if isInRange(x: nextX, y: nextY) && mapArr[nextX][nextY] != "X" && distance[nextX][nextY] == -1 {
                    distance[nextX][nextY] = distance[cx][cy] + 1
                    q.append((nextX, nextY))
                }
            }
        }
        
        return nil
    }
    
    func isInRange(x: Int, y: Int) -> Bool {
        if x >= 0 && x < maps.count && y >= 0 && y < maps[0].count {
            return true
        }
        return false
    }
    
    guard let cntToLever = bfs(x: startCoord.x, y: startCoord.y, target: "L") else { return -1 }
    guard let cntToExit = bfs(x: leverCoord.x, y: leverCoord.y, target: "E") else { return -1 }
    
    return cntToLever + cntToExit
}
