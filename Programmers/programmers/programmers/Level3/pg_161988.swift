//
//  pg_161988.swift
//  programmers
//
//  Created by sejin on 2023/08/03.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/161988
//  연속 펄스 부분 수열의 합

import Foundation

func solve161988() {
    print(solution([2, 3, -6, 1, 3, -1, 2, 4]))
}

fileprivate func solution(_ sequence:[Int]) -> Int64 {
    let positiveStartArr = sequence.enumerated().map { (index, value) in    // 1, -1, 1, -1,... 순서로 곱함
        return index % 2 == 0 ? value : value * -1
    }
    
    let negativeStartArr = sequence.enumerated().map { (index, value) in    // -1, 1, -1, 1,... 순서로 곱함
        return index % 2 == 0 ? value * -1 : value
    }
    
    let positiveStartArrMax = getMaxSum(targetArr: positiveStartArr)
    let negativeStartArrMax = getMaxSum(targetArr: negativeStartArr)
    
    return Int64(max(positiveStartArrMax, negativeStartArrMax))
}

fileprivate func getMaxSum(targetArr: [Int]) -> Int {
    var dp = Array(repeating: -Int.max, count: targetArr.count) // i번째 인덱스를 끝으로 가지는 서브 배열의 최댓값을 기록
    
    dp[0] = targetArr[0]
    
    for i in 1..<targetArr.count {
        let cur = targetArr[i]
        dp[i] = max(cur, dp[i-1]+cur)
    }
    
    return dp.max()!
}
