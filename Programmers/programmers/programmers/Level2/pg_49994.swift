//
//  pg_49993.swift
//  programmers
//
//  Created by sejin on 2022/09/04.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/49994
// 방문 길이

import Foundation

func solve49994() {
    print(solution("LULLLLLLU"))
}

fileprivate func solution(_ dirs:String) -> Int {
    var ch = Set<String>()
    var now: (Double, Double) = (0,0)
    for dir in dirs {
        switch dir {
        case "U":
            if isValid(x: now.0, y: now.1+1) {
                ch.insert("\(now.0) \(now.1+0.5)")
                now = (now.0, now.1+1)
            }
        case "D":
            if isValid(x: now.0, y: now.1-1) {
                ch.insert("\(now.0) \(now.1-0.5)")
                now = (now.0, now.1-1)
            }
        case "R":
            if isValid(x: now.0+1, y: now.1) {
                ch.insert("\(now.0+0.5) \(now.1)")
                now = (now.0+1, now.1)
            }
        case "L":
            if isValid(x: now.0-1, y: now.1) {
                ch.insert("\(now.0-0.5) \(now.1)")
                now = (now.0-1, now.1)
            }
        default :
            break
        }
    }
    
    return ch.count
}

fileprivate func isValid(x: Double, y: Double) -> Bool {
    if x > 5 || x < -5 || y > 5 || y < -5 {
        return false
    }
    return true
}
