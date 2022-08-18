//
//  pg_12948.swift
//  programmers-exercise
//
//  Created by sejin on 2022/07/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12948
// 핸드폰 번호 가리기

import Foundation

func solve12948() {
    let result = solution("01033334444")
    print(result)
}

fileprivate func solution(_ phone_number:String) -> String {
    let length = phone_number.count
    var res = String(repeating: "*", count: length - 4)
    let index = phone_number.index(phone_number.endIndex, offsetBy: -4)
    res.append(String(phone_number[index...]))
    
    return res
}
