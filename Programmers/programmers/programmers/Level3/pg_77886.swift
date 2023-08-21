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

// O(N)
fileprivate func remove110(_ num: String) -> String {
    var stack = [String]()
    
    for _char in num {
        let char = String(_char)
        if stack.count < 2 {
            stack.append(String(char))
        } else {
            let pop1 = stack.removeLast()
            let pop2 = stack.removeLast()
            let lastThreeWord = pop2 + pop1 + char
            if lastThreeWord != "110" {
                stack.append(contentsOf: [pop2, pop1, char])
            }
        }
    }
    
    return stack.joined()
}

// O(N)
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
