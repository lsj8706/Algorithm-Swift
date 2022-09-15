//
//  pg_42578.swift
//  programmers
//
//  Created by sejin on 2022/09/15.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42578
// 위장

import Foundation

func solve42578() {
    print(solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
}

fileprivate func solution(_ clothes:[[String]]) -> Int {
    
    var dict = [String: Int]()
    
    for item in clothes {
        let kind = item[1]
        let cnt = dict[kind] ?? 0
        dict[kind] = cnt + 1
    }
    
    var res = 1
    
    for num in dict.values {
        res *= (num + 1)
    }
    
    return res - 1 // 아무것도 안 입는 경우를 빼준다.
}
