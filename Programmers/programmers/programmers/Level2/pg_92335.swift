//
//  pg_92335.swift
//  programmers
//
//  Created by sejin on 2022/08/26.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/92335
// K진수에서 소수 개수 구하기

import Foundation

func solve92335() {
    print(solution(437674, 3))
}

fileprivate func solution(_ n:Int, _ k:Int) -> Int {
    var n = n
    var newValue = ""
    var ans = 0
    
    while true {
        newValue = "\(n % k)" + newValue
        n /= k
        if n < k {
            newValue = "\(n)" + newValue
            break
        }
    }
    
    for value in newValue.split(separator: "0") {
        if Int(value)! > 1 {
            if isPrime(Int(value)!) {
                ans += 1
            }
        }
    }
    
    return ans
}

fileprivate func isPrime(_ num: Int) -> Bool {
    if (num < 4) {
        return num == 0 || num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}
