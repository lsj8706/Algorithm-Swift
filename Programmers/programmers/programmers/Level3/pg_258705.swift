//
//  pg_258705.swift
//  programmers
//
//  Created by sejin on 1/18/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/258705
//  산 모양 타일링

import Foundation

func solve258705() {
//    print(solution(4, [1, 1, 0, 1]))
    print(solution(2, [0, 1]))
}

//  해설 참고
//  https://tech.kakao.com/2023/12/27/2024-coding-test-winter-internship/

fileprivate func solution(_ n:Int, _ tops:[Int]) -> Int {
    var withThirdWay = Array(repeating: 0, count: n+1)    // 3번 방법으로만 채울 수 있는 경우의 수
    var withoutThirdWay = Array(repeating: 0, count: n+1) // 3번 방법을 제외하고 채울 수 있는 경우의 수 (1,2,4번 방법)
    
    withThirdWay[1] = 1
    withoutThirdWay[1] = tops[0] == 1 ? 3 : 2
    
    if n == 1 {
        return withThirdWay[1] + withoutThirdWay[1]
    }
    
    let mod = 10007

    for i in 2..<n+1 {
        if tops[i-1] == 1 { // 위에 삼각형이 붙은 경우
            withThirdWay[i] = withThirdWay[i-1] + withoutThirdWay[i-1]
            withoutThirdWay[i] = 2 * withThirdWay[i-1] + 3 * withoutThirdWay[i-1]
        } else { // 위에 삼각형이 붙지 않은 경우
            withThirdWay[i] = withThirdWay[i-1] + withoutThirdWay[i-1]
            withoutThirdWay[i] = withThirdWay[i-1] + 2 * withoutThirdWay[i-1]
        }
        
        withThirdWay[i] %= mod
        withoutThirdWay[i] %= mod
    }
    
    return (withThirdWay[n] + withoutThirdWay[n]) % 10007
}
