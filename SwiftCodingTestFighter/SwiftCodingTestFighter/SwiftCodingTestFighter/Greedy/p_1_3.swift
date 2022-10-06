//
//  p_3.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/06.
//
// page 96
// 숫자 카드 게임

import Foundation

func solveP1_3() {
    let input = readLine()!.split(separator: " ").map({ Int($0)! })
    let n = input[0]
    
    var res = 0
    
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map({ Int($0)! })
        let min = row.min()!
        res = max(res, min)
    }
    
    print(res)
}
