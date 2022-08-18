//
//  pg_72410.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/16.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/72410
// 신규 아이디 추천


import Foundation

func solve72410() {
    print(solution("123_.def"))
}

fileprivate func solution(_ new_id:String) -> String {
    var res = ""
    let possible: [Character] = ["-", "_", "."]
    
    var dotCount = 0
    new_id.forEach {
        if $0.isLetter || $0.isNumber || possible.contains($0) {
            if $0 == "." {
                if dotCount >= 1 {
                    return
                }
                dotCount += 1
            }
            
            if $0 != "." {
                dotCount = 0
            }
            
            res.append($0.lowercased())
        }
    }
    
    trimDot(&res)

    if res.isEmpty {
        res = "a"
    }
    
    if res.count >= 16 {
        res = String(res.prefix(15))
    }
    
    trimDot(&res)
    
    if res.count <= 2 {
        while res.count != 3 {
            res.append(res.last!)
        }
    }
    
    return res
}

func trimDot(_ str: inout String) {
    if let firstChar = str.first {
        if firstChar == "." {
            str.removeFirst()
        }
    }
    
    if let lastChar = str.last {
        if lastChar == "." {
            str.removeLast()
        }
    }
}
