//
//  pg_68644.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/10.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/68644
// 두 개 뽑아서 더하기

import Foundation

func solve68644() {
    print(solution([5,0,2,7]))
}

fileprivate func solution(_ numbers:[Int]) -> [Int] {
    var set = Set<Int>()
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            set.insert(numbers[i]+numbers[j])
        }
    }
    return Array(set).sorted()
}
