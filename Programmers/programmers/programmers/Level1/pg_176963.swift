//
//  pg_176963.swift
//  programmers
//
//  Created by sejin on 2023/05/09.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/176963
// 추억 점수

import Foundation

func solve176963() {
    print(solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]))
}

fileprivate func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var result = Array(repeating: 0, count: photo.count)
    var dict = [String: Int]()
    
    for i in name.indices {
        dict[name[i]] = yearning[i]
    }
    
    for j in photo.indices {
        var sum = 0
        for k in photo[j] {
            sum += dict[k, default: 0]
        }
        
        result[j] = sum
    }
    
    return result
}
