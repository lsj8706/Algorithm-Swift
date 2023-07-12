//
//  pg_67258.swift
//  programmers
//
//  Created by sejin on 2023/07/12.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/67258
//  [카카오 인턴] 보석 쇼핑

import Foundation

func solve67258() {
//     print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
    print(solution(["AA", "AB", "AC", "AA", "AC"]))
}

fileprivate func solution(_ gems:[String]) -> [Int] {
    let gemKinds = Set(gems)
    var gemDict = [String: Int]() // 각 보석의 개수를 저장, key: 보석 이름, value: 보석 개수
    
    var start = 0
    var end = 0
    
    var result = [1, gems.count]
    
    var distance: Int {
        result[1] - result[0]
    }
    
    // 구간(범위)의 길이
    gemDict[gems[0]] = 1   // 첫번째 보석을 넣고 시작 (start와 end가 0부터 시작하기 때문)
    
    while end < gems.count && start <= end {
        if gemDict.keys.count == gemKinds.count {
            // 보석을 다 찾음 => 길이를 줄여야 함
            if end - start < distance {
                result = [start+1, end+1]
            }
            
            let gem = gems[start]
            gemDict[gem, default: 0] -= 1
            
            // 보석이 0개가 되면 딕셔너리에서 key 삭제
            if gemDict[gem] == 0 {
                gemDict.removeValue(forKey: gem)
            }
            
            start += 1
        } else {
            // 보석의 종류가 부족하기 때문에 범위를 늘려서 더 찾는다.
            end += 1
        }
    }

    return result
}
