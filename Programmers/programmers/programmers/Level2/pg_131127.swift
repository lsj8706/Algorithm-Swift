//
//  pg_131127.swift
//  programmers
//
//  Created by sejin on 2023/02/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/131127
// 할인 행사

import Foundation

func solve131127() {
    print(solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))
}

fileprivate func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var result = 0
    
    var wantDict = [String: Int]()
    
    for i in want.indices {
        wantDict[want[i]] = number[i]
    }
    
    var dict = [String: Int]()
    
    // 첫 10일
    for j in 0..<10 {
        let product = discount[j]
        
        dict[product, default: 0] += 1
    }
    
    if dict == wantDict {
        result += 1
    }
    
    if discount.count == 10 {
        return result
    }
    
    for i in 1...discount.count - 10 {
        let firstProduct = discount[i-1]
        dict[firstProduct] = dict[firstProduct]! - 1 // 이전 물건 제거
        if dict[firstProduct]! == 0 {
            dict[firstProduct] = nil
        }
        
        let lastProduct = discount[i+9] // 10번째 물건 추가

        dict[lastProduct, default: 0] += 1
                
        if dict == wantDict {
            result += 1
        }
    }
    return result
}
