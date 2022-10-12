//
//  T_1_3.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/07.
//
// page 313
// 문자열 뒤집기

import Foundation

func solveQ_3() {
    let input = readLine()!.map{ Int(String($0))! }
    
    var zeroCnt = 0
    var oneCnt = 0
    var prev = input[0]
    
    for i in 1..<input.count {
        let cur = input[i]
        if cur != prev {
            if prev == 0 {
                zeroCnt += 1
            } else {
                oneCnt += 1
            }
            prev = cur
        }
    }
    
    if prev == 0 {
        zeroCnt += 1
    } else {
        oneCnt += 1
    }
    
    
    print(min(zeroCnt, oneCnt))
}
