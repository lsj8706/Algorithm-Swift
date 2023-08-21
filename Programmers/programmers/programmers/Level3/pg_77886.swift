//
//  pg_77886.swift
//  programmers
//
//  Created by sejin on 2023/08/21.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/77886
//  110 옮기기

import Foundation

func solve77886() {
    print(solution(["1110","100111100","0111111010"]))
}

fileprivate func solution(_ s:[String]) -> [String] {
    var result = [String]()
    
    for num in s {
        let removedNum = remove110(num)
        let cnt = (num.count - removedNum.count) / 3    // 제거된 110의 수
        
        let insertedNum = insert110(removedNum: removedNum, cnt: cnt)
        result.append(insertedNum)
    }
    
    return result
}

fileprivate func remove110(_ num: String) -> String {
    var removed = num
    
    while true {
        let temp = removed.replacingOccurrences(of: "110", with: "")
        
        if temp == removed {
            return removed
        }
        
        removed = temp
    }
}

fileprivate func insert110(removedNum: String, cnt: Int) -> String {
    let reversedRemovedNum = Array(removedNum).reversed()
    var result = ""
    let target = Array(repeating: "011", count: cnt).joined()
    var isInserted = false
        
    for i in reversedRemovedNum {
        if i == "0" && !isInserted {
            result.append(target)
            isInserted = true
        }
        result.append(i)
    }
    
    if !isInserted {
        result.append(target)
    }
    
    return String(result.reversed())
}
