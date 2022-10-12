//
//  T_1.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/06.
//
// page 311
// 모험가 길드

import Foundation

func solveQ_1() {
    let n = Int(readLine()!)!
    
    var res = 0
    
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
    
    var team = [Int]()
    
    for i in 0..<n {
        team.append(arr[i])
        if team.count == team.last! {
            res += 1
            team.removeAll()
        }
    }
    
    print(res)
}
