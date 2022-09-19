//
//  pg_42586.swift
//  programmers
//
//  Created by sejin on 2022/09/19.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42586
// 기능개발

import Foundation

func solve42586() {
    print(solution([93, 30, 55], [1, 30, 5]))
}

fileprivate func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var time = Array(repeating: 0, count: progresses.count) // i 번째 작업에 필요한 일수
    var res = [Int]()
    
    for i in 0..<progresses.count {
        let progress = progresses[i]
        let speed = speeds[i]
        let day = ceil(Double(100 - progress) / Double(speed))
        time[i] = Int(day)
    }

    var prev = time[0]
    var cnt = 0
    for i in 0..<time.count {
        if time[i] <= prev {
            cnt += 1
        } else {
            res.append(cnt)
            prev = time[i]
            cnt = 1
        }
    }
    res.append(cnt)
    
    return res
}
