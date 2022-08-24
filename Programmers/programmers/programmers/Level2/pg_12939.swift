//
//  pg_12939.swift
//  programmers
//
//  Created by sejin on 2022/08/24.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12939
// 최댓값과 최솟값

import Foundation

func solve12939() {
    print(solution("1 2 3 4"))
}

fileprivate func solution(_ s:String) -> String {
    let arr = s.split(separator: " ").map({ Int($0)! }).sorted()
    let ans = "\(arr[0]) \(arr[arr.count-1])"
    
    return ans
}
