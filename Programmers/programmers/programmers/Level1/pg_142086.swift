//
//  pg_142086.swift
//  programmers
//
//  Created by sejin on 2023/02/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/142086
// 가장 가까운 같은 글자

import Foundation

func solve142086() {
    print(solution("banana"))
}

fileprivate func solution(_ s:String) -> [Int] {
    var dict = [Character: Int]()
    var result = [Int]()
    
    for (index, char) in s.enumerated() {
        if let nearestIndex = dict[char] {
            let distance = index - nearestIndex
            result.append(distance)
        } else {
            result.append(-1)
        }
        
        dict[char] = index
    }
    
    return result
}
