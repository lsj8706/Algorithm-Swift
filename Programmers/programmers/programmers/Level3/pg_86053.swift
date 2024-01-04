//
//  pg_86053.swift
//  programmers
//
//  Created by sejin on 1/4/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/86053
//  금과 은 운반하기

import Foundation

// parametric search 문제
// 이분탐색 범위설정 팁: https://www.acmicpc.net/blog/view/109

func solve86053() {
//    print(solution(10, 10, [100], [100], [7], [10]))
    print(solution(90, 500, [70,70,0], [0,0,500], [100,100,2], [4,8,1]))
}

fileprivate func solution(_ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Int64 {
    var lo = 0
    var hi = 400000000000000
    
    while lo + 1 < hi {
        let mid = (lo + hi) / 2
        let possible = isPossible(time: mid, a, b, g, s, w, t)

        if possible {
            hi = mid
        } else {
            lo = mid
        }
    }
    
    return Int64(hi)
}

fileprivate func isPossible(time: Int, _ a:Int, _ b:Int, _ g:[Int], _ s:[Int], _ w:[Int], _ t:[Int]) -> Bool {
    var total = 0
    var totalGold = 0
    var totalSilver = 0
    
    for i in 0..<g.count {
        // i는 도시 번호이자 트럭 번호를 의미
        
        var cnt = time / (2*t[i]) // cnt: 옮길 수 있는 횟수
        
        if time % (2*t[i]) >= t[i] { 
            cnt += 1
        }
        
        let weightsCanBeMoved = min(cnt*w[i], g[i]+s[i])
        total += weightsCanBeMoved
        
        totalGold += min(weightsCanBeMoved, g[i])
        totalSilver += min(weightsCanBeMoved, s[i])
    }
    
    return total >= (a+b) && totalGold >= a && totalSilver >= b
}
