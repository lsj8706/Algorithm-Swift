//
//  pg_12940.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12940
// 최대공약수와 최소공배수

import Foundation

func solve12940() {
    let result = solution(3, 12)
    print(result)
}


fileprivate func solution(_ n:Int, _ m:Int) -> [Int] {
    var small = 0
    var big = 0
    
    if n < m {
        small = n
        big = m
    } else {
        small = m
        big = n
    }
    
    var ans = [Int]()
    
    // 최대공약수
    for i in stride(from: small, to: 0, by: -1) {
        if small % i == 0 && big % i == 0{
            ans.append(i)
            break
        }
    }
    
    // 최고공배수
    for i in big...small*big {
        if i % small == 0 && i % big == 0 {
            ans.append(i)
            break
        }
    }
    
    return ans
}

