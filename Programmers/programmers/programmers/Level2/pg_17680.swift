//
//  pg_17680.swift
//  programmers
//
//  Created by sejin on 2022/09/15.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17680
// 캐시

import Foundation

func solve17680() {
    print(solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
}

fileprivate func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cnt = 0
    
    var stack = Array(repeating: "", count: cacheSize)
    
    func push(item: String) {
        if let index = stack.firstIndex(of: item) {
            stack.remove(at: index)
            stack.append(item)
            cnt += 1
        } else {
            if !stack.isEmpty {
                stack.removeFirst()
                stack.append(item)
            }
            cnt += 5
        }
    }
    
    for city in cities {
        push(item: city.lowercased())
    }
    
    return cnt
}
