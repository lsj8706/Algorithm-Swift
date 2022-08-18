//
//  pg_12903.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/09.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12903
// 가운데 글자 가져오기

import Foundation

func solve12903() {
    print(solution("abcd"))
}

fileprivate func solution(_ s:String) -> String {
    let index = s.index(s.startIndex, offsetBy: s.count / 2)
    if s.count > 1 && s.count % 2 == 0 {
        let evenIndex = s.index(s.startIndex, offsetBy: s.count / 2 - 1)
        return String(s[evenIndex...index])
    }
    
    return String(s[index])
}
