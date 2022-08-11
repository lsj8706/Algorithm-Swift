//
//  pg_42862.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42862
// 체육복

import Foundation

func solve42862() {
    print(solution(4, [2,3], [3,4]))
}

fileprivate func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var n = n
    var duplication = [Int]()
    
    for x in lost {
        if reserve.contains(x) {
            duplication.append(x)
        }
    }
    
    let lost = lost.sorted().filter {
        !duplication.contains($0)
    }
    
    var reserve = reserve.sorted().filter {
        !duplication.contains($0)
    }

    
    for lostPerson in lost {
        if !canBorrow(num: lostPerson, reserve: &reserve) {
            n -= 1
        }
    }
    
    return n
}

func canBorrow(num: Int, reserve: inout [Int]) -> Bool {
    for i in 0..<reserve.count {
        if reserve[i] >= num + 2 {
            break
        }
        
        if reserve[i] == num - 1 || reserve[i] == num + 1 {
            reserve.remove(at: i)
            return true
        }
    }
    
    return false
}
