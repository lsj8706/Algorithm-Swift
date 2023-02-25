//
//  pg_68645.swift
//  programmers
//
//  Created by sejin on 2023/02/25.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/68645
// 삼각 달팽이

import Foundation

func solve68645() {
    print(solution(5))
}

fileprivate func solution(_ n:Int) -> [Int] {
    var totalCount = 0
    var result = [[Int]]()
    
    for i in 0..<n {
        let countPerLevel = i+1
        totalCount += countPerLevel
        result.append(Array(repeating: 0, count: countPerLevel))
    }
    
    var level = 0
    var index = 0
    
    for i in 1...totalCount {
        if result[level][index] == 0 {
            result[level][index] = i
        }
        
        // 내려가기 체크
        if level + 1 < n && result[level+1][index] == 0 {
            if level - 1 >= 0 && index - 1 >= 0 && result[level-1][index-1] == 0 { // 올라가기
                level -= 1
                index -= 1
            } else { // 내려가기
                level += 1
            }
        } else if index + 1 <= level && result[level][index+1] == 0 { // 우측으로 이동
            index += 1
        } else { // 올라가기
            level -= 1
            index -= 1
        }
    }
        
    return result.flatMap { $0 }
}
