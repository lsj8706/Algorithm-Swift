//
//  pg_43162.swift
//  programmers
//
//  Created by sejin on 2023/07/04.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/43162
//  네트워크

import Foundation

func solve43162() {
//    print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
    print(solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]]))
}

fileprivate func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var result: Int = 0
    var visited: [Bool] = Array(repeating: false, count: n)
    
    func dfs(i: Int) {
        visited[i] = true
        let connectedComputers = computers[i]
                
        for (index, isConnected) in connectedComputers.enumerated() {
            if isConnected == 1 && !visited[index] {
                dfs(i: index)
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            result += 1
            dfs(i: i)
        }
    }
    
    return result
}
