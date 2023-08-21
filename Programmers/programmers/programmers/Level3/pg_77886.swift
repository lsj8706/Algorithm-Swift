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
    let removedNum = Array(removedNum)
    var cnt = cnt   // 110을 넣을 수 있는 기회
    var result = ""
    
    var i = 0
    
    while i < removedNum.count - 2 && cnt > 0 {
        let nextThreeWord = removedNum[i..<i+3]
        
        if nextThreeWord == ["1", "1", "1"] {
            result.append("110")
            cnt -= 1
        } else {
            result.append(removedNum[i])
            i += 1
        }
    }
    
    
    let remaining = String(removedNum[i...])
    
    if !remaining.contains(where: { $0 == "0" }) {
        for _ in 0..<cnt {
            result.append("110")
        }
        result.append(remaining)
    } else {
        result.append(remaining)
        for _ in 0..<cnt {
            result.append("110")
        }
    }
    
    return result
}
