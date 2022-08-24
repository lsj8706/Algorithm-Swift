//
//  pg_12941.swift
//  programmers
//
//  Created by sejin on 2022/08/24.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12941
// 최솟값 만들기

import Foundation

func solve12941() {
    print(solution([1,4,2], [5,4,4]))
}

fileprivate func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0
    
    let a = A.sorted(by: <)
    let b = B.sorted(by: >)
    
    for i in 0..<a.count {
        ans += a[i]*b[i]
    }

    return ans
}
