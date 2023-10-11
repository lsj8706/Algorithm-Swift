//
//  pg_176962.swift
//  programmers
//
//  Created by sejin on 2023/10/11.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/176962
//  과제 진행하기

import Foundation

func solve176962() {
    print(solution([["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]]))
//    print(solution([["science", "12:40", "50"], ["music", "12:20", "40"], ["history", "14:00", "30"], ["computer", "12:30", "100"]]))
}

fileprivate func solution(_ plans:[[String]]) -> [String] {
    var suspend = [Plan]()
    var result = [String]()
    var plans = plans.map(Plan.init)
    plans.sort {
        $0.startTime < $1.startTime
    }
    let count = plans.count
    
    var cur = plans.removeFirst()
    var now = cur.startTime // 현재 시각
    
    while !suspend.isEmpty || !plans.isEmpty {
        if !plans.isEmpty {
            let next = plans.first!
            if now + cur.remaining <= next.startTime { // 처리 가능
                if !suspend.isEmpty && now + cur.remaining < next.startTime  {  // 정지된 것
                    let suspendOne = suspend.removeLast()
                    result.append(cur.name)
                    now += cur.remaining
                    cur = suspendOne
                } else {
                    plans.removeFirst()
                    result.append(cur.name)
                    cur = next
                    now = cur.startTime
                }

            } else { // 일시 중지
                let remaining = now + cur.remaining - next.startTime
                cur.remaining = remaining
                suspend.append(cur)
                cur = plans.removeFirst()
                now = cur.startTime
            }
        } else {
            result.append(cur.name)
            for plan in suspend.reversed() {
                result.append(plan.name)
            }
            suspend.removeAll()
        }
    }
    
    if result.count < count {
        result.append(cur.name)
    }
    
    return result
}

fileprivate struct Plan {
    var name: String
    var remaining: Int
    var startTime: Int
    
    init(plan: [String]) {
        self.name = plan[0]
        self.remaining = Int(plan[2])!
        self.startTime = plan[1].toMinutes
    }
}

fileprivate extension String {
    var toMinutes: Int {
        let arr = self.components(separatedBy: ":")
        let hour = arr[0]
        let minutes = arr[1]
        return Int(hour)! * 60 + Int(minutes)!
    }
}
