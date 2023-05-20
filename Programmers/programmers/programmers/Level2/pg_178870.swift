//
//  pg_178870.swift
//  programmers
//
//  Created by sejin on 2023/05/20.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/178870
//  연속된 부분 수열의 합

import Foundation

func solve178870() {
    print(solution([1, 2, 3, 4, 5], 7))
}

fileprivate func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var result = [0, sequence.count - 1]
    // 투 포인터
    var start = 0
    var end = 0
    let count = sequence.count
    var sum = sequence[0]
    
    while start >= 0 && end < count && start <= end {
        
        if sum == k {
            if end - start < result[1]-result[0] {
                result = [start, end]
            }
            
            if end+1 < count {
                end += 1
                sum += sequence[end]
            } else {
                break
            }
            continue
        }
        
        if sum < k {
            if end+1 < count {
                end += 1
                sum += sequence[end]
            } else {
                break
            }
        } else if sum > k {
            sum -= sequence[start]
            start += 1
        }
    }
    
    return result
}
