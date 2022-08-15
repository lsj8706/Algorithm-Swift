//
//  pg_81301.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/15.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/81301
// 숫자 문자열과 영단어

import Foundation

func solve81301() {
    print(solution("one4seveneight"))
}

fileprivate func solution(_ s:String) -> Int {
    let letter = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    let arr = Array(s)
    var res = ""
    
    var temp = ""
    
    for i in 0..<arr.count {
        if arr[i].isNumber {
            res.append(arr[i])
        } else {
            temp.append(arr[i])
        }
        
        if let prev = letter.firstIndex(of: temp) {
            res.append(String(prev))
            temp.removeAll()
        }
    }
    
    return Int(res)!
}
