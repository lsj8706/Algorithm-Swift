//
//  pg_134239.swift
//  programmers
//
//  Created by sejin on 2023/10/05.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/134239
//  우박수열 정적분

import Foundation

func solve134239() {
    print(solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]))
}

fileprivate func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var k = k
    var progression = [k]
    
    while k > 1 {
        if k % 2 == 0 {
            k /= 2
        } else {
            k = 3*k + 1
        }
        
        progression.append(k)
    }
    
    let definteIntegral = calculateDefiniteIntegral(progression: progression) // 정적분 결과
    
    let n = progression.count - 1
    
    var result = [Double]()
    
    for range in ranges {
        let start = range[0]
        let end = n + range[1]
        
        if start == end {
            result.append(0)
        } else if start > end {
            result.append(-1)
        } else {
            let sum = definteIntegral[start...end-1].reduce(0, +)
            result.append(sum)
        }
    }
    
    return result
}

fileprivate func calculateDefiniteIntegral(progression: [Int]) -> [Double] {
    var result = [Double]()
    
    for x in 0..<progression.count - 1 {
        let y = progression[x]
        let nx = x + 1
        let ny = progression[nx]
        let area: Double = Double(max(y, ny)) - Double(abs(ny-y)) * 0.5
        
        result.append(area)
    }
    
    return result
}
