//
//  pg_64062.swift
//  programmers
//
//  Created by sejin on 2023/07/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/64062
//  징검다리 건너기

import Foundation

func solve64062() {
    print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))
}

fileprivate func solution(_ stones:[Int], _ k:Int) -> Int {
    var result = 200_000_000
    
    for i in 0..<(stones.count-k+1) {
        let subArr = stones[i..<(i+k)]
        let maxStone = subArr.max()!
        result = min(result, maxStone)
    }
    
    return result
}

// 길이가 k개인 서브 배열의 원소들의 최댓값을 구한다.
// 모든 서브 배열의 최댓값 중에서 가장 작은 값을 찾는다. => 이 값이 정답이다.
