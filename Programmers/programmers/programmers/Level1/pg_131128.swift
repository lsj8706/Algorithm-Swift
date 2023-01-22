//
//  pg_131128.swift
//  programmers
//
//  Created by sejin on 2023/01/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/131128?language=swift
// 숫자 짝꿍

import Foundation

func solve131128() {
    print(solution("100", "203045"))
}

fileprivate func solution(_ X:String, _ Y:String) -> String {
    var duplicatedNumber = [String]()
    
    // 0~9까지의 숫자가 X랑 Y에 각각 몇 개씩 있는지 확인 (어레이의 인덱스가 숫자를 의미)
    var numberCountOfX = Array(repeating: 0, count: 10)
    var numberCountOfY = Array(repeating: 0, count: 10)
    
    for x in X {
        let num = Int(String(x))!
        numberCountOfX[num] += 1
    }
    
    for y in Y {
        let num = Int(String(y))!
        numberCountOfY[num] += 1
    }
    
    for i in 0...9 {
        let countOfX = numberCountOfX[i]
        let countOfY = numberCountOfY[i]
        
        let duplicateCount = min(countOfX, countOfY)
        duplicatedNumber.append(contentsOf: Array(repeating: String(i), count: duplicateCount))
    }
        
    if duplicatedNumber.isEmpty {
        return "-1"
    }
    
    let set = Set(duplicatedNumber)
    
    if set.count == 1 && set == ["0"] {
        return "0"
    }
    
    return duplicatedNumber.sorted(by: >).joined()
}
