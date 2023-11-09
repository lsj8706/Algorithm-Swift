//
//  pg_87391.swift
//  programmers
//
//  Created by sejin on 2023/11/09.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/87391
//  공 이동 시뮬레이션

import Foundation

func solve87391() {
    print(solution(2, 2, 0, 0, [[2,1],[0,1],[1,1],[0,1],[2,1]]))
}

fileprivate func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    let queries = queries.reversed()
    // 직사각형의 좌상단 좌표
    var x1 = x
    var y1 = y
    // 직사각형의 우하단 좌표
    var x2 = x
    var y2 = y
    
    for query in queries {
        let direction = query[0]
        let distance = query[1]
        
        switch direction {
        case 0: // 좌
            if y1 == 0 {
                y2 += distance
            } else {
                y1 += distance
                y2 += distance
            }
        case 1: // 우
            if y2 == m-1 {
                y1 -= distance
            } else {
                y1 -= distance
                y2 -= distance
            }
        case 2: // 위
            if x1 == 0 {
                x2 += distance
            } else {
                x1 += distance
                x2 += distance
            }
        case 3: // 아래
            if x2 == n-1 {
                x1 -= distance
            } else {
                x1 -= distance
                x2 -= distance
            }
        default:
            break
        }
        
        if x1 >= n || y1 >= m || x2 < 0 || y2 < 0 {
            return 0
        }
        
        x1 = max(x1, 0)
        y1 = max(y1, 0)
        x2 = min(x2, n-1)
        y2 = min(y2, m-1)
    }
    
    let size = (x2-x1+1) * (y2-y1+1)
    
    return Int64(size)
}
