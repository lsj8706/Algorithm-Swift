//
//  pg_214288.swift
//  programmers
//
//  Created by sejin on 1/15/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/214288
//  상담원 인원

import Foundation

func solve214288() {
//    print(solution(3, 5, [[10, 60, 1], [15, 100, 3], [20, 30, 1], [30, 50, 3], [50, 40, 1], [60, 30, 2], [65, 30, 1], [70, 100, 2]]))
    print(solution(2, 3, [[5, 55, 2], [10, 90, 2], [20, 40, 2], [50, 45, 2], [100, 50, 2]]))
}

fileprivate func solution(_ k:Int, _ n:Int, _ reqs:[[Int]]) -> Int {
    let allDistributionCases = distributeInAdviceKind(n, k) // 멘토 분배 전체 경우의 수
    var reqsForAdviceKind = [Int: [[Int]]]()
    var result = Int.max
    
    for req in reqs {
        let kind = req[2]
        reqsForAdviceKind[kind, default: []].append(req)
    }
    
    for distribution in allDistributionCases {
        result = min(result, calculateWaitingTimes(k: k, reqsForAdviceKind: reqsForAdviceKind, distribution: distribution))
    }
    
    return result
}

fileprivate func calculateWaitingTimes(k: Int, reqsForAdviceKind: [Int: [[Int]]], distribution: [Int]) -> Int {
    var time = 0
    
    for i in 1...k {
        time += calculateWaitingTimes(reqs: reqsForAdviceKind[i, default: []], mentor: distribution[i-1])
    }

    return time
}

fileprivate func calculateWaitingTimes(reqs: [[Int]], mentor: Int) -> Int {
    var time = 0
    var q = [Int]() // 상담 끝나는 시간 큐 먼저 끝나는 시간이 앞으로 오게해야 함
    var cnt = mentor
    
    for req in reqs {
        if cnt >= 1 {
            q.append(req[0] + req[1])
            q.sort()
            cnt -= 1
            continue
        }
        
        if q.first! <= req[0] {
            q.removeFirst()
            q.append(req[0] + req[1])
            q.sort()
        } else {
            // 기다려야 함
            let first = q.removeFirst()
            time += first - req[0]
            q.append(first + req[1])
            q.sort()
        }
    }

    return time
}

// 멘토를 각 상담 유형에 분배하는 경우의 수 계산 (자연수 분할 알고리즘)
fileprivate func distributeInAdviceKind(_ n: Int, _ k: Int) -> [[Int]] {
    var result = [[Int]]()
    var currentDistribution = Array(repeating: 0, count: k)
    distributePeople(n, k, 0, &currentDistribution, &result)
    return result
}

fileprivate func distributePeople(_ n: Int, _ k: Int, _ startIndex: Int, _ currentDistribution: inout [Int], _ result: inout [[Int]]) {
    if k == 1 {
        currentDistribution[startIndex] = n
        result.append(currentDistribution)
        currentDistribution[startIndex] = 0
        return
    }
    
    for i in 1...(n-k+1) { // n-k+1은 특정 상담 종류에 넣을 수 있는 최대 인원 수
        currentDistribution[startIndex] = i
        distributePeople(n-i, k-1, startIndex+1, &currentDistribution, &result)
    }
    currentDistribution[startIndex] = 0
}
