//
//  pg_12913.swift
//  programmers
//
//  Created by sejin on 2022/08/27.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12913
// 땅따먹기

import Foundation

func solve12913() {
    print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
}

fileprivate func solution(_ land:[[Int]]) -> Int{
    // DP 문제
    // 재귀로 풀게되면 시간 초과 발생
    var answer = 0
    let length = land.count
    var arr = land
    
    for i in 1..<length {
        arr[i][0] += max(arr[i-1][1], arr[i-1][2], arr[i-1][3])
        arr[i][1] += max(arr[i-1][0], arr[i-1][2], arr[i-1][3])
        arr[i][2] += max(arr[i-1][0], arr[i-1][1], arr[i-1][3])
        arr[i][3] += max(arr[i-1][0], arr[i-1][1], arr[i-1][2])
    }
    
    answer = arr[length-1].max()!
    
    return answer
}
