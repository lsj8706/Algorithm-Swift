//
//  pg_12951.swift
//  programmers
//
//  Created by sejin on 2022/08/20.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12951
// JadenCase 문자열 만들기

import Foundation

func solve12951() {
    print(solution("3people  unFollowed  me"))
}

fileprivate func solution(_ s:String) -> String {
    let words = s.components(separatedBy: " ")
    var res = ""
    
    for word in words {
        let arr = Array(word)
        for i in 0..<arr.count {
            if i == 0 {
                res.append(arr[i].uppercased())
            } else {
                res.append(arr[i].lowercased())
            }
        }
    
        res.append(" ")
    }
    
    res.removeLast()
    return res
}
