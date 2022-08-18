//
//  pg_12901.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/10.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12901
// 2016년

import Foundation

func solve12901() {
    print(solution(5, 24))
}

fileprivate func solution(_ a:Int, _ b:Int) -> String {

    let monthDay = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let days = monthDay[0..<a-1].reduce(0, +) + b
    let remainder = days % 7 - 1
    let dayOfWeek = ["FRI","SAT","SUN","MON","TUE","WED","THU"]
    
    return remainder == -1 ? "THU" : dayOfWeek[remainder]
}
