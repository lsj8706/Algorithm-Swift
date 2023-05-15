//
//  pg_118667.swift
//  programmers
//
//  Created by sejin on 2023/05/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/118667
//  두 큐 합 같게 만들기

import Foundation

func solve118667() {
    print(solution([1, 4], [4, 8]))
}

private func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var result = 0
    
    var q1 = DoubleStackQueue(array: queue1)
    var q2 = DoubleStackQueue(array: queue2)
    
    let sum = queue1.reduce(0, +) + queue2.reduce(0, +)
    if sum % 2 != 0 { return -1 } // 총 합이 홀수이면 두 큐의 합을 같게 만들 수 없다.
    
    var sum1 = q1.origin.reduce(0, +)
    var sum2 = q2.origin.reduce(0, +)
    
    while sum1 != sum2 {
        
        if result > 2*queue1.count { return -1 }
        
        while !q2.isEmpty && sum1 < sum2 {
            let first = q2.dequeue()!
            q1.enqueue(first)
            sum1 += first
            sum2 -= first
            result += 1
        }
        
        while !q1.isEmpty && sum1 > sum2 {
            let first = q1.dequeue()!
            q2.enqueue(first)
            sum2 += first
            sum1 -= first
            result += 1
        }
    }
    
    return result
}
