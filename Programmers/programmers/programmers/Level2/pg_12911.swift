//
//  pg_12911.swift
//  programmers
//
//  Created by sejin on 2022/08/28.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12911
// 다음 큰 숫자


import Foundation

func solve12911() {
    print(solution(78))
}

fileprivate func solution(_ n:Int) -> Int {
    let binaryN = changeToBinary(n)
    let oneCnt = countOne(binaryN)
    
    var i = n + 1
    
    while true {
        let binary = changeToBinary(i)
        let cnt = countOne(binary)
        
        if oneCnt == cnt {
            break
        }
        
        i += 1
    }
    
    return i
}

fileprivate func changeToBinary(_ n: Int) -> String {
    var res = ""
    var n = n
    
    while true {
        if n < 2 {
            res = String(n) + res
            break
        }
        
        res = String(n % 2) + res
        
        n /= 2
    }
    
    return res
}

fileprivate func countOne(_ n: String) -> Int {
    return n.filter { $0 == "1" }.count
}
