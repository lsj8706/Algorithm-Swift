//
//  pg_86491.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/10.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/86491
// 최소직사각형

import Foundation

func solve86491() {
    print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))
}

fileprivate func solution(_ sizes:[[Int]]) -> Int {
    var small = 0
    var big = 0
    
    for size in sizes {
        let a = size.sorted()[0]
        let b = size.sorted()[1]
        
        if small < a {
            small = a
        }
        
        if big < b {
            big = b
        }
    }
    
    return small * big
}
