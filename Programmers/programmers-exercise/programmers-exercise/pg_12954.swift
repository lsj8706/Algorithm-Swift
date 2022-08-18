//
//  pg_12954.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12954
// x만큼 간격이 있는 n개의 숫자

import Foundation

func solve12954() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (x, n) = (input[0], input[1])
    
    let result = solution(x, n)
    print(result)
}

fileprivate func solution(_ x:Int, _ n:Int) -> [Int64] {
    
    var res = [Int64]()
    for i in 1...n {
        res.append(Int64(x*i))
    }
    
    return res
}
