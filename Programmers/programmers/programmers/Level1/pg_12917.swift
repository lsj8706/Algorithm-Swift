//
//  pg_12917.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/07.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12917
// 문자열 내림차순으로 배치하기

import Foundation

func solve12917() {
    print(solution("Zbcdefg"))
}

fileprivate func solution(_ s:String) -> String {
    let sortedArray = s.sorted(by: >).map { String($0) }
    
    return sortedArray.joined()
}
