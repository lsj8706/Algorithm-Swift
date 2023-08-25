//
//  pg_70130.swift
//  programmers
//
//  Created by sejin on 2023/08/25.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/70130
//  스타 수열

import Foundation

func solve70130() {
    print(solution([5,2,3,3,5,3]))
}

fileprivate func solution(_ a:[Int]) -> Int {
    let startLen = a.count % 2 == 0 ? a.count : a.count - 1
    
    for len in stride(from: startLen, through: 2, by: -2) {
        let subsequences = getSubsequence(arr: a, len: len)
        
        for subsequence in subsequences {
            let isStar = isStartSequence(arr: subsequence)
            
            if isStar {
                return subsequence.count
            }
        }
    }
    
    return 0
}

// 스타 수열인지 확인, arr는 크기가 2 이상만 가능
fileprivate func isStartSequence(arr: [Int]) -> Bool {
    var intersection = Set<Int>()
    intersection.formUnion(arr[0...1])
    
    for i in stride(from: 0, to: arr.count-1, by: 2) {
        if arr[i] == arr[i+1] {
            return false
        }
        
        intersection = intersection.intersection(arr[i...i+1])
        
        if intersection.count < 1 {
            return false
        }
    }
    
    return true
}

// 부분 수열 구하기
fileprivate func getSubsequence(arr: [Int], len: Int) -> [[Int]] {
    var result = Set<[Int]>()
    
    func dfs(i: Int, cur: [Int]) {
        if cur.count == len {
            result.insert(cur)
            return
        }
        
        if i >= arr.count {
            return
        }
        
        for j in i..<arr.count {
            dfs(i: j+1, cur: cur + [arr[j]])
        }
    }
    
    dfs(i: 0, cur: [])
    
    return Array(result)
}
