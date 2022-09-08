//
//  pg_12980.swift
//  programmers
//
//  Created by sejin on 2022/09/08.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12980
// 점프와 순간 이동

import Foundation

func solve12980() {
    print(solution(5000))
}

fileprivate func solution(_ n:Int) -> Int
{
    // 0부터 n까지 계산하는 것이 아니라 반대로 n부터 0까지로 계산
    
    var ans = 0
    
    var n = n

    while n > 0 {
        if n % 2 == 0 {
            n /= 2
        } else {
            n = (n - 1) / 2
            ans += 1
        }
    }
    
    return ans
}
