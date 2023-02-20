//
//  pg_43165.swift
//  programmers
//
//  Created by sejin on 2023/02/20.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/43165
// 타겟 넘버

import Foundation

func solve43165() {
    print(solution([1, 1, 1, 1, 1], 3))
}

fileprivate func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(index: Int, sum: Int) {
        if index == numbers.count {
            if sum == target {
                result += 1
            }
            return
        }
        
        dfs(index: index + 1, sum: sum + numbers[index]) // 더하기
        dfs(index: index + 1, sum: sum - numbers[index]) // 빼기
    }
    
    dfs(index: 0, sum: 0)
    
    return result
}
