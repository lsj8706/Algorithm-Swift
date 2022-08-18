//
//  pg_12950.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12950
// 행렬의 덧셈

import Foundation

func solve12950() {
    let result = solution([[1,2],[2,3]], [[3,4],[5,6]])
    print(result)
}


fileprivate func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var res = arr1
    for i in 0..<arr1.count {
        for j in 0..<arr1[0].count {
            res[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    
    return res
}
