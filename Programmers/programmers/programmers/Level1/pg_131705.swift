//
//  pg_131705.swift
//  programmers
//
//  Created by sejin on 2023/01/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/131705
// 삼총사

import Foundation

func solve131705() {
    print(solution([-2, 3, 0, 2, -5]))
}

fileprivate func solution(_ number:[Int]) -> Int {
    var result = 0
    let combiResults = combination(number, 3)
    
    for combi in combiResults {
        if combi.reduce(0, +) == 0 {
            result += 1
        }
    }
    
    return result
}

fileprivate func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0, [])
    
    return result
}
