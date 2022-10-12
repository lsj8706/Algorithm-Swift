//
//  Q_8.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/13.
//
// page 322
// 문자열 재정렬

import Foundation

func solveQ_8() {
    let input = Array(readLine()!)
    var alphabet = [Character]()
    var number = [Int]()
    
    for x in input {
        if x.isNumber {
            number.append(Int(String(x))!)
        } else if x.isLetter {
            alphabet.append(x)
        }
    }
    
    alphabet.sort()
    number.sort()
    
    for y in alphabet {
        print(y, terminator: "")
    }
    
    let sum = number.reduce(0, +)
    print(sum)
}
