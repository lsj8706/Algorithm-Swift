//
//  Q_7.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/13.
//
// page 321
// 럭키 스트레이트

import Foundation

func solveQ_7() {
    let input = readLine()!.map{ Int(String($0))! }
    
    let midIndex = (input.count / 2) - 1
        
    let leftSum = input[0...midIndex].reduce(0, +)
    let rightSum = input[midIndex+1..<input.count].reduce(0, +)
    
    leftSum == rightSum ? print("LUCKY") : print("READY")
}
