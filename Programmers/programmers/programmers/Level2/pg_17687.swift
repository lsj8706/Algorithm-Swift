//
//  pg_17687.swift
//  programmers
//
//  Created by sejin on 2022/08/28.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17687
// N진수 게임

import Foundation

func solve17687() {
    print(solution(2, 4, 2, 1))
}

fileprivate func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var all = [Character]()
    var res = ""
    var i = 0
    var cnt = 0

    
    while all.count < t*m {
        let changedNum = changeNum(n: n, decimalNum: i)

        all += Array(changedNum)
        i += 1
        
        if cnt == t {
            break
        }
    }
    
    var index = p - 1 // 첫 위치 (p가 1이면 첫 번째로 말해야 함)
    
    while cnt < t {
        res += String(all[index])
        index += m
        cnt += 1
    }

    return res
}

fileprivate func changeNum(n: Int, decimalNum: Int) -> String {
    var res = ""
    var decimalNum = decimalNum
    
    while true {
        if decimalNum < n {
            switch decimalNum {
            case 10:
                res = "A" + res
            case 11:
                res = "B" + res
            case 12:
                res = "C" + res
            case 13:
                res = "D" + res
            case 14:
                res = "E" + res
            case 15:
                res = "F" + res
            default:
                res = String(decimalNum) + res
            }
            break
        }
        
        switch decimalNum % n {
        case 10:
            res = "A" + res
        case 11:
            res = "B" + res
        case 12:
            res = "C" + res
        case 13:
            res = "D" + res
        case 14:
            res = "E" + res
        case 15:
            res = "F" + res
        default:
            res = String(decimalNum % n) + res
        }
        
        decimalNum /= n
    }
    
    return res
}

