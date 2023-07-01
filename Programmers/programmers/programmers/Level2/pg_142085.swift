//
//  pg_142085.swift
//  programmers
//
//  Created by sejin on 2023/07/01.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/142085
//  디펜스 게임

import Foundation

func solve142085() {
//    print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
    print(solution(2, 4, [3, 3, 3, 3]))
}

fileprivate func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var result = 0
 
    func canDefence(index: Int) -> Bool {
        let enemySlice = enemy[0...index].sorted(by: >)
        var soldiers = n
        
        for (i, enemyCnt) in enemySlice.enumerated() {
            if i < k { continue }   // 무적권 사용
            
            soldiers -= enemyCnt
            
            if soldiers < 0 {
                return false
            }
        }
        
        return true
    }
    
    var left = 0
    var right = enemy.count
    
    while left < right {
        let mid = (left + right) / 2
        
        if canDefence(index: mid) {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    result = left
    
    return result
}



//  참고: https://ksb-dev.tistory.com/257
//  파라메트릭 서치(Parametric Search)
//  이분 탐색을 통해 범위를 좁혀 나가며 해답을 찾는다. (이 문제에서는 라운드의 범위를 좁혀 나간다.)
