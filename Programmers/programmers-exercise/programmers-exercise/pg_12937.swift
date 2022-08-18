//
//  pg_12937.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/02.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12937
// 짝수와 홀수

import Foundation

func solve12937() {
    print(solution(3))
}


fileprivate func solution(_ num:Int) -> String {
    return num % 2 == 0 ? "Even" : "Odd"
}
