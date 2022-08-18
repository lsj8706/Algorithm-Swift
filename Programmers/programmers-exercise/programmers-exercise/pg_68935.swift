//
//  pg_68935.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/68935
// 3진법 뒤집기

import Foundation

func solve68935() {
    print(solution(125))
}

fileprivate func solution(_ n:Int) -> Int {
    var ternay = [Int]()
    var n = n
    while true {
        if n < 3 {
            ternay.append(n)
            break
        }
        let rest = n % 3
        n /= 3
        ternay.append(rest)
    }
    let reverseTernary = ternay
    var ans: Double = 0
    var i = reverseTernary.count - 1
    
    for x in reverseTernary {
        ans += Double(x) * pow(3.0, Double(i))
        i -= 1
    }
    return Int(ans)
}
