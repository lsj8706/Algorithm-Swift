//
//  pg_77485.swift
//  programmers
//
//  Created by sejin on 2023/06/03.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/77485
//  행렬 테두리 회전하기

import Foundation

func solve77485() {
    print(solution(6, 6, [[2,2,5,4],[3,3,6,6],[5,1,6,3]]))
}

fileprivate func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var map = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var num = 1
    for i in 0..<rows {
        for j in 0..<columns {
            map[i][j] = num
            num += 1
        }
    }
    
    var result = [Int]()
    
    for query in queries {
        let temp = map
        let x1 = query[0]-1
        let y1 = query[1]-1
        let x2 = query[2]-1
        let y2 = query[3]-1
        
        var minValue = Int.max
        
        // 상단
        for y in 1...(y2-y1) {
            let targetX = x1
            let targetY = y1+y
            map[targetX][targetY] = temp[x1][y1+y-1]
            
            minValue = min(minValue, map[targetX][targetY])
        }
        
        // 우측
        for x in 1...(x2-x1) {
            let targetX = x1+x
            let targetY = y2
            map[targetX][targetY] = temp[x1+x-1][y2]
            
            minValue = min(minValue, map[targetX][targetY])
        }
        
        // 하단
        for y in 1...(y2-y1) {
            let targetX = x2
            let targetY = y2-y
            map[targetX][targetY] = temp[x2][y2-y+1]
            
            minValue = min(minValue, map[targetX][targetY])
        }
        
        // 좌측
        for x in 1...(x2-x1) {
            let targetX = x2-x
            let targetY = y1
            map[targetX][targetY] = temp[x2-x+1][y1]
            
            minValue = min(minValue, map[targetX][targetY])
        }
        
        result.append(minValue)
    }
    
    return result
}
