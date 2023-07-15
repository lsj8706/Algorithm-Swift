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
    var start = 0
    var end = k - 1
    
    var maxStone = stones[0...k-1].max()!   // 서브 배열의 최댓값
    var result = maxStone
    
    var dict = [Int: Int]() // key: 돌에 적힌 숫자, value: 해당 숫자가 나온 횟수
    
    for i in stones[0...k-1] {
        dict[i, default: 0] += 1
    }
    
    while end < stones.count-1 {
        end += 1
        let endStone = stones[end]
        dict[endStone, default: 0] += 1
        
        maxStone = max(maxStone, endStone)
        
        let startStone = stones[start]
        dict[startStone, default: 0] -= 1
        
        if dict[startStone] == 0 {
            dict.removeValue(forKey: startStone)
            if startStone == maxStone {
                maxStone = dict.keys.max()!
            }
        }
        
        start += 1

        result = min(result, maxStone)
    }
    
    return result
}

// 길이가 k개인 서브 배열의 원소들의 최댓값을 구한다.
// 모든 서브 배열의 최댓값 중에서 가장 작은 값을 찾는다. => 이 값이 정답이다.
