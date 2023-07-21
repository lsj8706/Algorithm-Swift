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
    var jobs = Array(jobs.reversed())
    let count = jobs.count
    var currentTime = 0
    var heap = Heap<Job>(sortFunction: <)
    var totalTime = 0
    
    while !heap.isEmpty || !jobs.isEmpty {
        while !jobs.isEmpty && jobs.last![0] <= currentTime {
            heap.insert(Job(job: jobs.removeLast()))
        }
        
        let nextJob = heap.remove()!
        
        let endTime = currentTime + nextJob.requiredTime
        
        totalTime += endTime - nextJob.inputTime
        
        currentTime = endTime
    }
    
    return totalTime / count
}

fileprivate struct Job: Comparable {
    var inputTime: Int
    var requiredTime: Int
    
    static func < (lhs: Job, rhs: Job) -> Bool {
        lhs.requiredTime < rhs.requiredTime
    }
    
    init(job: [Int]) {
        self.inputTime = job[0]
        self.requiredTime = job[1]
    }
}
