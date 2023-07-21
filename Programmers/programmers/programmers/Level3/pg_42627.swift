//
//  pg_42627.swift
//  programmers
//
//  Created by sejin on 2023/07/21.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42627
//  디스크 컨트롤러

import Foundation
import SwiftDataStructure

func solve42627() {
    print(solution([[0, 3], [1, 9], [2, 6]]))
}

fileprivate func solution(_ jobs:[[Int]]) -> Int {
    var jobs = jobs.sorted(by: { $0[0] >= $1[0] })  // 작업 요청 시점을 내림차순으로 정렬 (시간 복잡도가 낮은 removeLast를 사용하기 위해)
    let count = jobs.count
    var currentTime = 0
    var heap = Heap<Job>(sortFunction: <)
    var totalTime = 0   // 각 작업이 요청부터 종료까지 걸린 시간들의 합
    
    while !heap.isEmpty || !jobs.isEmpty {
        while !jobs.isEmpty && jobs.last![0] <= currentTime {
            heap.insert(Job(job: jobs.removeLast()))
        }
        
        if let nextJob = heap.remove() {
            let endTime = currentTime + nextJob.requiredTime
            
            totalTime += endTime - nextJob.inputTime
            
            currentTime = endTime
        } else {    // Heap이 비어있다면 현재 시각에서 가장 가까운 작업을 찾아서 헤당 작업의 요청 시각으로 이동
            currentTime = jobs.last![0]
        }
    }
    
    return totalTime / count
}

fileprivate struct Job: Comparable {
    var inputTime: Int      // 작업이 요청되는 시점
    var requiredTime: Int   // 작업의 소요 시간
    
    static func < (lhs: Job, rhs: Job) -> Bool {
        if lhs.requiredTime == rhs.requiredTime {
            return lhs.inputTime < rhs.inputTime
        }
        
        return lhs.requiredTime < rhs.requiredTime
    }
    
    init(job: [Int]) {
        self.inputTime = job[0]
        self.requiredTime = job[1]
    }
}
