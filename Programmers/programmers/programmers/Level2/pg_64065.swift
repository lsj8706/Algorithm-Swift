//
//  pg_64065.swift
//  programmers
//
//  Created by sejin on 2023/02/17.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/64065
// 튜플

import Foundation

func solve64065() {
    print(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))
}

fileprivate func solution(_ s:String) -> [Int] {
    let startIdx = s.index(s.startIndex, offsetBy: 2)
    let lastIdx = s.index(s.endIndex, offsetBy: -3)
    var s = String(s[startIdx...lastIdx]).components(separatedBy: "},{")
    s.sort {
        $0.count < $1.count
    }
    
    var result = [Int]()
    var numberSet = Set<Int>()
    
    for str in s {
        let currentNumberSet = Set(str.split(separator: ",").map { Int($0)! })
        let difference = currentNumberSet.symmetricDifference(numberSet)
        
        result.append(difference[difference.startIndex])
        numberSet = currentNumberSet
    }

    return result
}
