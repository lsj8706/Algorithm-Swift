//
//  pg_12919.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/07.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12919
// 서울에서 김서방 찾기

import Foundation

func solve12919() {
    print(solution(["Jane", "Kim"]))
}

fileprivate func solution(_ seoul:[String]) -> String {
    let index = seoul.firstIndex(where: { $0 == "Kim" })
    
    return "김서방은 \(index!)에 있다"
}
