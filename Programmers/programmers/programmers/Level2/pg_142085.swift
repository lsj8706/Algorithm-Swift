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
    print(solution(7, 3, [4, 2, 4, 5, 3, 3, 1]))
//    print(solution(2, 4, [3, 3, 3, 3]))
}

fileprivate func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    var result = enemy.count
    var n = n
    var k = k
    
    var heap = Heap<Int>(sortFunction: { $0 > $1 })
    
    for (i, enemyCnt) in enemy.enumerated() {
        heap.insert(node: enemyCnt)
        
        n -= enemyCnt

        if n - enemyCnt < 0 {
            while k > 0 && n < 0 {
                // 무적권 사용 (이전에 지나온 라운드에도 무적권 사용한 것으로 소급적용 가능)
                let pastMax = heap.remove()!
                n += pastMax
                k -= 1
            }
        }
        
        if n < 0 {
            result = i
            break
        }
    }
    
    return result
}

//  참고: https://school.programmers.co.kr/questions/43442
