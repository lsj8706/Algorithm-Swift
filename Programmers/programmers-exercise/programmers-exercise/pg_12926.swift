//
//  pg_12926.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/04.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12926
// 시저 암호

import Foundation

func solve12926() {
    print(solution("a B z", 4))
}

fileprivate func solution(_ s:String, _ n:Int) -> String {
    var res: String = ""
    for c in s {
        if c == " " {
            res.append(" ")
        } else {
            let asciiNum = c.asciiValue!
            let dest = asciiNum + UInt8(n)
            // 대문자
            if asciiNum >= 65 && asciiNum <= 90 {
                if dest > 90 {
                    let move = dest - 90
                    res.append(String(UnicodeScalar(64 + move)))
                } else {
                    res.append(String(UnicodeScalar(dest)))
                }
            } else {
                //소문자 (97~122)
                if dest > 122 {
                    let move = dest - 122
                    res.append(String(UnicodeScalar(96 + move)))
                } else {
                    res.append(String(UnicodeScalar(dest)))
                }
            }
        }
    }
    
    return res
}
