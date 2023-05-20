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
    print(solution([2, 2, 2, 2, 2], 6))
}

fileprivate func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var result = [Int]()
    var len = 1 // 부분 수열의 길이
    let count = sequence.count
    
    // sequence에서 start 인덱스부터 end 인덱스까지의 합을 저장할 2차원 배열 (dp)
    var memory = Array(repeating: Array(repeating: 0, count: count), count: count)
    
    func getSumAtMemory(start: Int, end: Int) -> Int {
        var sum = memory[start][end]
        
        if sum == 0 { // memory에서 못 찾은 경우
            if end - 1 >= 0 {
                sum = memory[start][end-1] + sequence[end]
            } else {
                sum = sequence[start]
            }
            memory[start][end] = sum
            return sum
        }
        
        return sum
    }
    
    // 부분 수열의 길이를 1부터 증가시키면서 찾는다
    outer: while len <= sequence.count {
        for i in 0..<sequence.count {
            if i+len > sequence.count { break }
            let sum = getSumAtMemory(start: i, end: i+len-1)

            if sum > k { break }
            
            if sum == k {
                result = [i, i+len-1]
                break outer
            }
        }
        
        len += 1
    }
    
    return result
}
