//
//  pg_77885.swift
//  programmers
//
//  Created by sejin on 2023/02/25.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/77885
// 2개 이하로 다른 비트

import Foundation

func solve77885() {
    print(solution([2,7]))
}

fileprivate func solution(_ numbers:[Int64]) -> [Int64] {
    var result = [Int64]()
    
    for number in numbers {
        var binaryNumber = Array(String(number, radix: 2)).map { String($0) }
        if let firstZeroIndex = binaryNumber.reversed().firstIndex(of: "0") {
            binaryNumber[firstZeroIndex.base-1] = "1"
            if firstZeroIndex.base < binaryNumber.count {
                binaryNumber[firstZeroIndex.base] = "0"
            }
        } else {
            binaryNumber[0] = "0"
            binaryNumber = ["1"] + binaryNumber
        }
        
        let outcome: Int64 = Int64(binaryNumber.joined(), radix: 2)!
        result.append(outcome)
    }
    
    return result
}

// 참고 링크 : https://school.programmers.co.kr/questions/34049
