//
//  pg_131702.swift
//  programmers
//
//  Created by sejin on 1/19/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/131702
//  고고학 최고의 발견

import Foundation

func solve131702() {
    print(solution([[0,3,3,0],[3,2,2,3],[0,3,2,0],[0,3,3,3]]))
}

fileprivate func solution(_ clockHands:[[Int]]) -> Int {
    var result = Int.max
    
    // 첫 번째 행의 모든 경우의 수 탐색
    func dfs(y: Int, cnt: Int, clock: [[Int]]) {
        if y == clock.count {
            if let totalCnt = calculateTotalRotateCnt(clock: clock, startCnt: cnt) {
                result = min(result, totalCnt)
            }
            return
        }
        
        let rotateCases = [0, 1, 2, 3]
        
        for c in rotateCases {
            let newClock = rotate(clock: clock, x: 0, y: y, rotateCnt: c)
            
            dfs(y: y+1, cnt: cnt+c, clock: newClock)
        }
    }
    
    dfs(y: 0, cnt: 0, clock: clockHands)

    return result
}


// 임의의 첫 번째 행 상태에서 이후 행들 조작
fileprivate func calculateTotalRotateCnt(clock: [[Int]], startCnt: Int) -> Int? {
    var result = startCnt
    var clock = clock
    
    for x in 1..<clock.count {
        for y in 0..<clock[0].count {
            let upper = clock[x-1][y] // 현재 위치의 바로 위의 칸
            let needToRotateCnt = (4 - upper) % 4
            clock = rotate(clock: clock, x: x, y: y, rotateCnt: needToRotateCnt)
            result += needToRotateCnt
        }
    }

    return canOpen(clock: clock) ? result : nil
}

fileprivate func rotate(clock: [[Int]], x: Int, y: Int, rotateCnt: Int) -> [[Int]] {
    var newClock = clock
    let dx = [0, 0, 0, 1, -1]
    let dy = [0, 1, -1, 0, 0]
    let size = clock.count
    
    for i in 0..<5 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0 && nx < size && ny >= 0 && ny < size {
            newClock[nx][ny] = (newClock[nx][ny] + rotateCnt) % 4
        }
    }
    
    return newClock
}

// 마지막 행이 전부 0으로 변했는지 확인
fileprivate func canOpen(clock: [[Int]]) -> Bool {
    let lastRow = clock.count - 1
    
    for y in clock[0].indices {
        if clock[lastRow][y] != 0 {
            return false
        }
    }
    
    return true
}
