//
//  pg_135807.swift
//  programmers
//
//  Created by sejin on 2023/06/20.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/135807
//  숫자 카드 나누기

import Foundation

func solve135807() {
    print(solution([10, 20], [5, 17]))
}

fileprivate func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let arrayA = arrayA.sorted()
    let arrayB = arrayB.sorted()
    
    var result = 0

    // A에서 가장 작은 수까지의 약수들로 비교 (가장 작은수보다 커지면 나누는 것 불가)
    outer: for i in stride(from: arrayA[0], through: 2, by: -1) {
        
        for a in arrayA {
            if a % i != 0 {
                continue outer
            }
        }
        
        for b in arrayB {
            if b % i == 0 {
                continue outer
            }
        }
        
        result = max(result, i)
        break
    }
    
    // B에서 가장 작은 수까지의 약수들로 비교 (가장 작은수보다 커지면 나누는 것 불가)
    outer: for i in stride(from: arrayB[0], through: 2, by: -1) {
        
        if i <= result { break }
        
        for b in arrayB {
            if b % i != 0 {
                continue outer
            }
        }
        
        for a in arrayA {
            if a % i == 0 {
                continue outer
            }
        }
        
        result = max(result, i)
    }
    
    return result
}
