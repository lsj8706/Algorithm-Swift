//
//  pg_12931.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/03.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12931
// 자릿수 더하기

import Foundation

func solve12931() {
    print(solution(123))
}

fileprivate func solution(_ n:Int) -> Int
{
    let res = Int(String(n).map({ String($0) }).reduce(0, { $0 + Int($1)! }))

    return res
}
