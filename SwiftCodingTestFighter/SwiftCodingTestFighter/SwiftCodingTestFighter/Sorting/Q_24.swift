//
//  Q_24.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/19.
//
// Page 360
// 안테나
// https://www.acmicpc.net/problem/18310

import Foundation

func solveQ_24() {
    let n = Int(readLine()!)!
    let houses = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    
    print(houses[(n-1)/2])
}
