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
    print(3/2)
    let n = Int(readLine()!)!
    let houses = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    let mid = houses[houses.count / 2]
    
    if n % 2 != 0 {
        print(mid)
    } else {
        let mid2 = houses[houses.count / 2 - 1] // 이 코드가 위에 있으면 n이 1일 때 컴파일 에러 발생

        var total1 = 0
        houses.forEach {
            total1 += abs($0-mid)
        }
        var total2 = 0
        houses.forEach {
            total2 += abs($0-mid2)
        }
        
        total2 <= total1 ? print(mid2) : print(mid)
    }
}
