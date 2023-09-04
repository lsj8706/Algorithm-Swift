//
//  pg_160586.swift
//  programmers
//
//  Created by sejin on 2023/09/04.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/160586
//  대충 만든 자판

import Foundation

func solve160586() {
    print(solution(["ABACD", "BCEFD"], ["ABCD","AABB"]))
}

fileprivate func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    
    var dict = [Character: Int]() // key: 알파벳, value: 최소 인덱스
    
    for key in keymap {
        for (index, alpha) in key.enumerated() {
            dict[alpha] = min(index+1, dict[alpha] ?? 100)
        }
    }
    
    var result = [Int]()
    
    for target in targets {
        var cnt = 0
        
        for alpha in target {
            guard let index = dict[alpha] else {
                cnt = -1
                break
            }
            cnt += index
        }
        
        result.append(cnt)
    }
    
    return result
}
