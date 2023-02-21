//
//  pg_42839.swift
//  programmers
//
//  Created by sejin on 2022/08/18.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42839
// 소수 찾기

import Foundation

func solve42839() {
    print(solution("17"))
}

fileprivate func solution(_ numbers:String) -> Int {
    
    var res = Set<Int>()
    
    for i in 1...numbers.count {
        permutation(Array(numbers).map({ String($0) }), i).forEach {
            res.insert($0)
        }
    }
    
    return getPrimeCount(Array(res))
}

fileprivate func permutation(_ array: [String], _ n: Int) -> [Int] {
    var result = [Int]()
    if array.count < n { return result }

    var stack: [(String, [Bool])] = array.enumerated().map {
        var visited = Array(repeating: false, count: array.count)
        visited[$0.offset] = true
        return ($0.element, visited)
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let elements = now.0
        var visited = now.1
        
        if elements.count == n {
            result.append(Int(elements)!)
            continue
        }
        
        for i in 0...array.count-1 {
            if visited[i] { continue }
            visited[i] = true
            stack.append(((elements) + array[i], visited))
            visited[i] = false
        }
    }
    return result
}

fileprivate func getPrimeCount(_ arr: [Int]) -> Int {
    var cnt = 0
    
    for num in arr {
        if isPrime(num: num) {
            cnt += 1
        }
    }
    
    return cnt
}

fileprivate func isPrime(num: Int) -> Bool {
    if (num < 4) {
        return num == 0 || num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}
