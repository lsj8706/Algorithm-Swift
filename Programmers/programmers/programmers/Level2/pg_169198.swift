//
//  pg_169198.swift
//  programmers
//
//  Created by sejin on 1/1/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/169198
//  당구 연습

import Foundation

func solve169198() {
    print(solution(10, 10, 3, 7, [[7, 7], [2, 7], [7, 3]]))
}


// 참고: https://school.programmers.co.kr/questions/45921
// 꼭짓점에 부딧히는 경우에는 거리가 최솟값이 될 수 없기 때문에 배제 가능

fileprivate func solution(_ m:Int, _ n:Int, _ startX:Int, _ startY:Int, _ balls:[[Int]]) -> [Int] {
    
    func getDistance(a: Int, b: Int) -> Int {
        return a*a + b*b
    }
    
    func calculateMinDistance(x: Int, y: Int) -> Int {
        var res = Int.max
        
        // 1. 좌측 벽 원쿠션
        var movedX = -startX
        var movedY = startY
        var temp = getDistance(a: (x+abs(movedX)), b: abs(y-startY))
        if !(y == startY && startX > x) { // 미리 충돌 방지
            res = min(res, temp)
        }
        
        // 2. 상단 벽 원쿠션
        movedX = startX
        movedY = n+n-startY
        temp = getDistance(a: abs(x-startX), b: movedY-y)
        if !(x == startX && startY < y) { // 미리 충돌 방지
            res = min(res, temp)
        }
        
        // 3. 우측 벽 원쿠션
        movedX = m+m-startX
        movedY = startY
        temp = getDistance(a: abs(y-startY), b: movedX-x)
        if !(y == startY && startX < x) { // 미리 충돌 방지
            res = min(res, temp)
        }
        
        // 4. 하단 벽 원쿠션
        movedX = startX
        movedY = -startY
        temp = getDistance(a: abs(x-startX), b: y+abs(movedY))
        if !(x == startX && startY > y) { // 미리 충돌 방지
            res = min(res, temp)
        }
        
        return res
    }
    
    var results = [Int]()
    
    for ball in balls {
        results.append(calculateMinDistance(x: ball[0], y: ball[1]))
    }
    
    return results
}

