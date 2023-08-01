//
//  pg_68646.swift
//  programmers
//
//  Created by sejin on 2023/08/01.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/68646
//  풍선 터뜨리기

import Foundation

func solve68646() {
    print(solution([9,-1,-5]))
//    print(solution([-16,27,65,-2,58,-92,-71,-68,-61,-33]))
}

fileprivate func solution(_ a:[Int]) -> Int {
    // 자신보다 큰 수가 왼쪽 또는 오른쪽의 최솟값으로서 존재하면 가능
    var result = 0
    var leftMin = Array(repeating: 1_000_000_000, count: a.count)   // 각 인덱스를 기준으로 왼쪽 부분의 최솟값을 저장
    var rightMin = Array(repeating: 1_000_000_000, count: a.count)  // 각 인덱스를 기준으로 오른쪽 부분의 최솟값을 저장
    
    for i in 1..<a.count {
        leftMin[i] = min(leftMin[i-1], a[i-1])
    }
    
    for i in stride(from: a.count-2, through: 0, by: -1) {
        rightMin[i] = min(rightMin[i+1], a[i+1])
    }
    
    for i in a.indices {
        let cur = a[i]
        
        let leftMinNum = leftMin[i]
        let rightMinNum = rightMin[i]
        
        if cur < leftMinNum || cur < rightMinNum {
            result += 1
        }
    }
    
    return result
}
