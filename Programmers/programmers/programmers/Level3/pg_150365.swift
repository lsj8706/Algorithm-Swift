//
//  pg_150365.swift
//  programmers
//
//  Created by sejin on 2023/08/22.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/150365
//  미로 탈출 명령어

import Foundation

func solve150365() {
    print(solution(3, 4, 2, 3, 3, 1, 5))
//    print(solution(2, 2, 1, 1, 2, 2, 2))
//    print(solution(3, 3, 1, 2, 3, 3, 4))
}

fileprivate func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    func distanceToEnd(x: Int, y: Int) -> Int {
        return abs(x-r) + abs(y-c)
    }
    
    let distanceFromStartToEnd = distanceToEnd(x: x, y: y)
    
    if k - distanceFromStartToEnd < 0 || (k - distanceFromStartToEnd) % 2 != 0 {
        return "impossible"
    }
   
    // 사전 순
    let directions = ["d", "l", "r", "u"]
    let dx = [1, 0, 0, -1]
    let dy = [0, -1, 1, 0]
    
    // bfs
    var queue = [(x: Int, y: Int, course: String, cnt: Int)]()
    queue.append((x, y, "", 0))
    
    while !queue.isEmpty {
        let (x, y, course, cnt) = queue.removeFirst()
        
        if (x, y) == (r, c) && cnt == k {
            return course
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nextCourse = course + directions[i]
            
            // 너무 멀리 와서 목적지까지의 최단 거리가 k보다 커지는 경우 -> 종료 조건
            if distanceToEnd(x: nx, y: ny) + cnt + 1 > k {
                continue
            }
            
            if nx >= 1 && nx <= n && ny >= 1 && ny <= m {
                queue.append((nx, ny, nextCourse, cnt+1))
                break
            }
        }
    }
    
    return "impossible" // 여기까지 오는 경우는 없음
}
