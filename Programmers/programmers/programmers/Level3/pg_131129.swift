//
//  pg_131129.swift
//  programmers
//
//  Created by sejin on 2023/09/26.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/131129
//  카운트 다운

import Foundation

func solve131129() {
//    print(solution(21))
    print(solution(58))
}

fileprivate func solution(_ target:Int) -> [Int] {
    var dp = Array(repeating: target, count: 100_000 + 1)  // index: 총 점수, dp[index]: 총 index 점수가 나왔을 때 던진 다트 개수의 최솟값
    var singleOrBullCnt = Array(repeating: 0, count: 100_000 + 1)    // singleOrBullCnt[i] 는 총 i점수가 나왔을 때 싱글이나 불이 나온 횟수
    
    if target <= 20 {
        return [1, 1]
    }
    
    let numbers = makePossibleNumbers()
    
    numbers.forEach {
        dp[$0] = 1
        if isSingleOrBull($0) {
            singleOrBullCnt[$0] = 1
        }
    }
    
    for i in 21...target {
        for num in numbers {
            if i - num > 0 {
                let oneIfSingleOrBull = isSingleOrBull(num) ? 1 : 0
                
                if dp[i-num] + 1 < dp[i] {
                    dp[i] = dp[i-num] + 1
                    singleOrBullCnt[i] = singleOrBullCnt[i-num] + oneIfSingleOrBull
                } else if dp[i-num]+1 == dp[i] {
                    singleOrBullCnt[i] = max(singleOrBullCnt[i], singleOrBullCnt[i-num] + oneIfSingleOrBull)
                }
            } else {
                break
            }
        }
    }
    
    return [dp[target], singleOrBullCnt[target]]
}

// 1발의 다트를 던져서 얻을 수 있는 수를 오름차순으로 정렬해서 리턴
fileprivate func makePossibleNumbers() -> [Int] {
    var numbers = (1...20).map { $0 }
    
    (1...20).forEach { num in
        numbers.append(num * 2)
        numbers.append(num * 3)
    }
    
    numbers.append(50)
    
    return Set(numbers).sorted()
}

fileprivate func isSingleOrBull(_ num: Int) -> Bool {
    return num <= 20 || num == 50
}
