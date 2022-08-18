//
//  pg_12930.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/03.
//
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12930
// 이상한 문자 만들기

import Foundation

func solve12930() {
    print(solution("try hello world"))
}

fileprivate func solution(_ s:String) -> String {
    let arr = s.components(separatedBy: " ")
    var res = [String]()
    
    arr.forEach {
        var temp = ""
        for (i, char) in $0.enumerated() {
            if i % 2 == 0 {
                temp += char.uppercased()
            } else {
                temp += char.lowercased()
            }
        }
        res.append(temp)
    }
    
    return res.joined(separator: " ")
}
