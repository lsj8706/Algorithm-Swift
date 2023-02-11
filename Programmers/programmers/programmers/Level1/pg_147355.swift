//
//  pg_147355.swift
//  programmers
//
//  Created by sejin on 2023/02/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/147355
// 크기가 작은 부분 문자열

import Foundation

func solve147355() {
    print(solution("3141592", "271"))
}

private func solution(_ t:String, _ p:String) -> Int {
    var t = Array(t).map { String($0) }
    
    var result = 0
    let size = p.count
    
    var i = 0
    
    while i+size-1 < t.count {
        let portion = t[i...i+size-1]
        
        let num = Int(portion.joined())!
        
        if num <= Int(p)! {
            result += 1
        }
        
        i += 1
    }
    
    return result
}
