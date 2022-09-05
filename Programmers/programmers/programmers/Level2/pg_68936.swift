//
//  pg_68936.swift
//  programmers
//
//  Created by sejin on 2022/09/05.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/68936
// 쿼드압축 후 개수 세기

import Foundation

func solve68936() {
    print(solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]))
}

fileprivate func solution(_ arr:[[Int]]) -> [Int] {
    var res = [0, 0]
    
    func dfs(x: Int, y: Int, size: Int) {
        let temp = arr[x][y]
        for i in 0..<size {
            for j in 0..<size {
                if arr[x+i][y+j] != temp {
                    dfs(x: x, y: y, size: size/2)
                    dfs(x: x, y: y+size/2, size: size/2)
                    dfs(x: x+size/2, y: y, size: size/2)
                    dfs(x: x+size/2, y: y+size/2, size: size/2)
                    return
                }
            }
        }
        
        res[temp] += 1
    }
    
    dfs(x: 0, y: 0, size: arr.count)
    
    return res
}
