//
//  pg_12971.swift
//  programmers
//
//  Created by sejin on 2023/07/13.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/12971
//  스티커 모으기(2)

import Foundation

func solve12971() {
    print(solution([14, 6, 5, 11, 3, 9, 2, 10]))
}

fileprivate func solution(_ sticker:[Int]) -> Int{
    if sticker.count == 1 || sticker.count == 2 {
        return sticker.max()!
    }
    
    var answer = 0
    
    var dp1 = Array(repeating: 0, count: sticker.count)
    var dp2 = Array(repeating: 0, count: sticker.count)
    
    // dp1에서는 첫번째 스티커를 뜯는다. -> 마지막 스티커가 찢어진다. -> 마지막 스티커는 검사할 필요가 사라진다.
    dp1[0] = sticker[0]
    dp1[1] = max(sticker[0], sticker[1])
    
    for i in 2..<(dp1.count-1) {
        dp1[i] = max(dp1[i-1], dp1[i-2]+sticker[i])
    }
    
    // dp2에서는 첫번째 스티커를 뜯지 않는다. -> 마지막 스티커를 검사할 필요가 생긴다.
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in 2..<dp2.count {
        dp2[i] = max(dp2[i-1], dp2[i-2]+sticker[i])
    }
    
    let maxOfDp1 = dp1[dp1.count-2]
    let maxOfDp2 = dp2[dp2.count-1]
    
    answer = max(maxOfDp1, maxOfDp2)

    return answer
}
