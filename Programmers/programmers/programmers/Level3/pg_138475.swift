//
//  pg_138475.swift
//  programmers
//
//  Created by sejin on 2023/11/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/138475
//  억억단을 외우자

import Foundation

func solve138475() {
    print(solution(8, [1,3,7]))
}

fileprivate func solution(_ e:Int, _ starts:[Int]) -> [Int] {
    var arr = Array(repeating: 0, count: e+1)
    
    for i in 1...e {
        for j in stride(from: i, through: e, by: i) {
            arr[j] += 1
        }
    }

    var dp = Array(repeating: 0, count: e+1) // dp[i] 는 e-i...e 까지의 원소 중 등장 횟수 최댓값
    var mostNum = Array(repeating: e, count: e+1) // mostNum[i] 는 e-i...e 까지의 원소 중 가장 많이 등장한 숫자
    let reversedArr = Array(arr.reversed())
    dp[0] = reversedArr[0]
    
    for i in 1...e {
        if dp[i-1] <= reversedArr[i] {
            dp[i] = reversedArr[i]
            mostNum[i] = e-i
        } else {
            dp[i] = dp[i-1]
            mostNum[i] = mostNum[i-1]
        }
    }
    
    let reversedMostNum = Array(mostNum.reversed())
    
    var result = [Int]()
    
    for start in starts {
        result.append(reversedMostNum[start])
    }
    
    return result
}

