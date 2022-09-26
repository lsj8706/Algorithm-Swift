//
//  pg_42883.swift
//  programmers
//
//  Created by sejin on 2022/09/26.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42883
// 큰 수 만들기

import Foundation

func solve42883() {
    print(solution("4177252841", 4))
}

fileprivate func solution(_ number:String, _ k:Int) -> String {
    
    let number = Array(number).map{ Int(String($0))! }
    var cnt = k
    var stack = [Int]()
    
    for (_, value) in number.enumerated() {
        while true {
            if let last = stack.last, last < value,  cnt > 0 {
                stack.removeLast()
                cnt -= 1
            } else {
                stack.append(value)
                break
            }
        }

    }
    
    for _ in 0..<cnt {
        stack.removeLast()
    }
    
    return stack.reduce("", { $0 + String($1) })
}
