//
//  pg_42895.swift
//  programmers
//
//  Created by sejin on 2023/08/28.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42895

import Foundation

func solve42895() {
    print(solution(5, 12))
}

fileprivate func solution(_ N:Int, _ number:Int) -> Int {
    var canMake = Array(repeating: Set<Int>(), count: 9) // Index: N의 개수, Value: Index개의 N으로 만들 수 있는 수의 집합
    canMake[1] = [N]
    
    if number == N {
        return 1
    }
    
    for i in 2...8 {
        var cur = Set<Int>() // i개의 N으로 만들 수 있는 수의 집합
        
        cur.insert(Int(String(repeating: String(N), count: i))!) /// NNN
        
        for j in 1...(i/2) {
            let prev1 = canMake[j]      // j개의 N으로 만들 수 있는 수의 집합
            let prev2 = canMake[i-j]    // i-j개의 N으로 만들 수 있는 수의 집합
           
            for a in prev1 {
                for b in prev2 {
                    cur.formUnion(doFourOperations(a, b))
                }
            }
        }
        
        if cur.contains(number) {
            return i
        }
        
        canMake[i] = cur
    }

    return -1
}

// 사칙연산 수행
fileprivate func doFourOperations(_ a: Int, _ b: Int) -> Set<Int> {
    var res = Set<Int>()
    
    res.insert(a + b)
    res.insert(a - b)
    res.insert(b - a)
    res.insert(a * b)
    
    if b != 0 {
        res.insert(a / b)
    }
    
    if a != 0 {
        res.insert(b / a)
    }
    
    return res
}
