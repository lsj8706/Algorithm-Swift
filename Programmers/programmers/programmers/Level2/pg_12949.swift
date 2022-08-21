//
//  pg_12949.swift
//  programmers
//
//  Created by sejin on 2022/08/21.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12949
// 행렬의 곱셈

import Foundation

func solve12949() {
    print(solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4], [2, 4], [3, 1]]))
}

fileprivate func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var res = Array(repeating: Array(repeating: 0, count: arr2[0].count), count: arr1.count)
    
    for i in 0..<res.count {
        for j in 0..<res[0].count {
            var sum = 0
            for k in 0..<arr1[0].count {
                sum += arr1[i][k]*arr2[k][j]
            }
            res[i][j] = sum
        }
    }
    
    return res
}


// 1 4  3 3
// 3 2  3 3
// 4 1
