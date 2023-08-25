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
    var answer = 0
    
    var cnt = [Int: Int]() // key: a의 요소, value: 해당 key가 a에 몇개 존재하는지 개수를 저장
    
    for num in a {
        cnt[num, default: 0] += 1
    }
    
    for num in cnt.keys {
        if cnt[num]! <= answer {
            continue
        }
        
        var result = 0
        
        var i = 0
        
        while i < a.count-1 {
            if (a[i] == num || a[i+1] == num) && (a[i] != a[i+1]) {
                result += 1
                i += 1
            }
            
            i += 1
        }
        
        answer = max(answer, result)
    }
    
    
    return answer*2
}
