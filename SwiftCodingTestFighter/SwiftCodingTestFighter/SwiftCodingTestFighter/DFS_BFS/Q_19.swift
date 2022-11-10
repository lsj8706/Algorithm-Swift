//
//  Q_19.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/10.
//
// page 349
// 연산자 끼워 넣기
// https://www.acmicpc.net/problem/14888

import Foundation

func solveQ_19() {
    let N = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map{ Int($0)! }
    var operators = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var maxRes = -1000000000
    var minRes = 1000000000
    
    func DFS(index: Int, total: Int) {
        if index == N {
            maxRes = max(total, maxRes)
            minRes = min(total, minRes)
            return
        }
        
        for i in 0..<operators.count {
            if operators[i] > 0 {
                operators[i] -= 1
                let result = getNewTotal(total: total, num: numbers[index], operatorIndex: i)
                
                DFS(index: index+1, total: result)
                operators[i] += 1
            }
        }
    }
    
    DFS(index: 1, total: numbers[0])
    print(maxRes)
    print(minRes)
}


func getNewTotal(total: Int, num: Int, operatorIndex: Int) -> Int {
    var result = total
    switch operatorIndex {
    case 0:
        result += num
    case 1:
        result -= num
    case 2:
        result *= num
    case 3:
        result /= num
    default:
        break
    }
    
    return result
}
