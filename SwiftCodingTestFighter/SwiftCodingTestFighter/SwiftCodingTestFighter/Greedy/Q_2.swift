//
//  T_2.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/06.
//
// page 312
// 곱하기 혹은 더하기

import Foundation

func solveQ_2() {
    let input = readLine()!.map{ Int(String($0))! }
    var res = input[0]
    
    for i in 1..<input.count {
        let num = input[i]
        if num <= 1 || res <= 1 {
            res += num
        } else {
            res *= num
        }
    }
    
    print(res)
}
