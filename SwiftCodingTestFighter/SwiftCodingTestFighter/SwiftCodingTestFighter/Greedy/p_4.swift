//
//  p_4.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/06.
//
// page 99
// 1이 될 때까지

import Foundation

func solveP4() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    var n = input[0]
    let k = input[1]
    
    var cnt = 0
    
    while n >= k {
        if n % k != 0 {
            n -= 1
        } else {
            n /= k
        }
        
        cnt += 1
    }
    
    cnt += n - 1
    
    print(cnt)
}
