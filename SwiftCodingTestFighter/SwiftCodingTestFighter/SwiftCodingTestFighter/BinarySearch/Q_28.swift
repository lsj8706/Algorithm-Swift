//
//  Q_28.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/24.
//
// page 368
// 고정점 찾기


import Foundation

func solveQ_28() {
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    var start = 0
    var end = n - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if mid == arr[mid] {
            print(mid)
            return
        }
        if mid > arr[mid] {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    print(-1)
}
