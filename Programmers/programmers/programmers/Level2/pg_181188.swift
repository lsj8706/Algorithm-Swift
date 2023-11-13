//
//  pg_181188.swift
//  programmers
//
//  Created by sejin on 2023/11/13.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/181188
//  요격 시스템

import Foundation

func solve181188() {
    print(solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]))
}

fileprivate func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted(by: { $0[0] < $1[0] })
    var result = 0
    
    var start = targets[0][0]
    var end = targets[0][1]
    
    for target in targets {
        if result == 0 {
            result += 1
            continue
        }
        
        let curStart = target[0]
        let curEnd = target[1]
        
        if curStart >= start && curStart < end { // 겹치는 구간이 있는 경우
            start = max(start, curStart)
            end = min(end, curEnd)
        } else {    // 겹치는 구간이 없는 경우
            start = curStart
            end = curEnd
            result += 1
        }
    }
    
    return result
}
