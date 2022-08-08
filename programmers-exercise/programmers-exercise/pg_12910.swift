//
//  pg_12910.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/08.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12910
// 나누어 떨어지는 숫자 배열

import Foundation

func solve12910() {
    print(solution([5,7,9,10], 5))
}

fileprivate func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let ans = arr.filter { $0 % divisor == 0 }.sorted()
    
    return ans.isEmpty ? [-1] : ans
}
