//
//  pg_12977.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/14.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12977
// 소수 만들기

import Foundation

func solve12977() {
    print(solution([1,2,3,4]))
}

fileprivate func solution(_ nums:[Int]) -> Int {
    var answer = 0

    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let sum = nums[i] + nums[j] + nums[k]
                if checkPrimeNumber(num: sum) {
                    answer += 1
                }
            }
        }
    }

    return answer
}

fileprivate func checkPrimeNumber(num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
