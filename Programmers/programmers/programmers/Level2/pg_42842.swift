//
//  pg_42842.swift
//  programmers
//
//  Created by sejin on 2022/09/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42842
// 카펫

import Foundation

func solve42942() {
    print(solution(24, 24))
}

fileprivate func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    let n = sqrt(Double(total))
    
    var res = [Int]()
    
    for i in 3...(Int(n)+1) {
        let width = i
        let height = total / width
        
        if width * height == total {
            if (width * 2) + (height - 2) * 2 == brown {
                res = [width, height]
                break
            }
        }
    }
    
    return res.sorted(by: >)
}
