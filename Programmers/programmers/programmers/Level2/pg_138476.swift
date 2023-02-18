//
//  pg_138476.swift
//  programmers
//
//  Created by sejin on 2023/02/18.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/138476
// 귤 고르기

import Foundation

func solve138476() {
    print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
}

fileprivate func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var k = k
    var fruitSizeDict = [Int: Int]() // 각 사이즈 별 귤의 개수를 담은 딕셔너리
    var result = 0
    
    for size in tangerine {
        if let count = fruitSizeDict[size] {
            fruitSizeDict[size] = count + 1
        } else {
            fruitSizeDict[size] = 1
        }
    }
    
    let numberOfTangerinesBySize = fruitSizeDict.values.sorted(by: >)
    
    for numberOfTangerines in numberOfTangerinesBySize {
        k = k - numberOfTangerines
        result += 1
        
        if k <= 0 {
            break
        }
    }
    
    return result
}
