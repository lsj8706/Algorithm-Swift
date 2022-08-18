//
//  pg_82612.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/09.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/82612
// 부족한 금액 계산하기

import Foundation

func solve82612() {
    print(solution(3, 20, 4))
}

fileprivate func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    
    var tot = 0
    for i in 1...count {
        tot += i*price
    }
    
    answer = Int64(tot - money)
    
    return answer > 0 ? answer : 0
}
