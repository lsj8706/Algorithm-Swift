//
//  pg_12932.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/03.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12932
// 자연수 뒤집어 배열로 만들기

import Foundation

func solve12932() {
    print(solution(12345))
}

fileprivate func solution(_ n:Int64) -> [Int] {
    var arr = [Int]()
    var num = n
    
    while num > 0 {
        arr.append(Int(num) % 10)
        num /= 10
    }
    
    return arr
}
