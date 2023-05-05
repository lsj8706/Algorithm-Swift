//
//  pg_154539.swift
//  programmers
//
//  Created by sejin on 2023/05/05.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/154539
// 뒤에 있는 큰 수 찾기

import Foundation

func solve154539() {
    print(solution([2,3,3,5]))
}

fileprivate func solution(_ numbers:[Int]) -> [Int] {
    var result = Array(repeating: -1, count: numbers.count)
    var stack = [Int]()
    
    for i in numbers.indices {
        while !stack.isEmpty && numbers[stack.last!] < numbers[i] {
            result[stack.popLast()!] = numbers[i]
        }
        
        stack.append(i)
    }
    
    return result
}

// 거꾸로 생각하자
// 일반적으로 numbers 어레이를 이중 for문으로 돌면서 현재 위치의 값보다 큰 값을 찾으려고 하는데
// 이때, 복잡도가 O(n^2)이여서 시간 초과가 발생한다.
// 따라서, 사고를 반대로 하여 stack에 당장의 인덱스를 넣어두고 이 인덱스에 위치한 값보다 큰 수가 나타났을 때 result의 해당 인덱스에 이 큰 값을 넣어준다.
// 이렇게 하면 O(2n)이 된다.
