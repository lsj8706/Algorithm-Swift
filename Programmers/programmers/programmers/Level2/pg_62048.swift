//
//  pg_62048.swift
//  programmers
//
//  Created by sejin on 2023/06/19.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/62048
//  멀쩡한 사각형

import Foundation

func pg62048() {
    print(solution(8, 12))
}

fileprivate func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    var cnt: Int64 = 0
    
    // 기울기
    var slope = Double(h)/Double(w)
    
    // 교점 구하기
    func getIntersection(x: Double) -> Double {
        return slope * x
    }
    
    func getIntersection(y: Double) -> Double {
        return y / slope
    }
    
    outer: for y in 0..<h {
        for x in 0..<w {
            let x = Double(x)
            let y = Double(y)
            
            // 윗변
            var interX = getIntersection(y: y)
            
            if interX >= x && interX < x+1 {
                cnt += 1
                continue
            }
            
            // 좌측변
            var interY = getIntersection(x: x)
            
            if interY >= y && interY < y+1 {
                cnt += 1
                continue
            }
            
            // 우측변
            interY = getIntersection(x: x+1)
            
            if interY > y && interY <= y+1 {
                cnt += 1
                continue
            }
            
            // 아랫변
            interX = getIntersection(y: y+1)
            
            // 더 이상 해당 Y에서 교점이 없는 경우
            if interX <= x {
                continue outer
            }
            
            if interX > x && interX <= x+1 {
                cnt += 1
                continue
            }
        }
    }
    
    answer = Int64(w*h) - cnt
    
    return answer
}
