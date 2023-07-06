//
//  pg_12987.swift
//  programmers
//
//  Created by sejin on 2023/07/06.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/12987
//  숫자 게임

import Foundation

func solve12987() {
    print(solution([5,1,3,7], [2,2,6,8]))
}

fileprivate func solution(_ a:[Int], _ b:[Int]) -> Int {
    let a = a.sorted()
    var b = b.sorted()
    var result = 0
    
    for i in stride(from: a.count-1, through: 0, by: -1) {
        let num = a[i]
        let last = b.last!
        if last > num {
            _ = b.popLast()
            result += 1
        }
    }
    
    return result
}
