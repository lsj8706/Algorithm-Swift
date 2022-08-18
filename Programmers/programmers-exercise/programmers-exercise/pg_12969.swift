//
//  pg_12969.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12969
// 직사각형 별직기

import Foundation

func solve12969() {
    let n = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (a, b) = (n[0], n[1])
    
    for _ in 0..<b {
        for _ in 0..<a {
            print("*", terminator: "")
        }
        print()
    }
}
