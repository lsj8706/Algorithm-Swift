//
//  pg_60062.swift
//  programmers
//
//  Created by sejin on 2023/08/17.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/60062
//  외벽 점검

import Foundation

func solve60062() {
    print(solution(12, [1, 5, 6, 10], [1, 2, 3, 4]))
}

fileprivate func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    let dist = dist.sorted(by: >)
    var repairStatus = [Int: Bool]()
    
    for weakPosition in weak {
        repairStatus[weakPosition] = false
    }
    
    var repairedCnt: Int {
        repairStatus.values.filter({ $0 == true }).count
    }
    
    var result = -1
    
    func coveredPositions(start: Int, dist: Int) -> [Int] {
        let end = start + dist
        return weak.filter {
            if end < n {
                return $0 >= start && $0 <= end
            } else {
                return $0 >= start || $0 <= end % n
            }
        }
    }
    
    func findProperPostion(friend: Int) -> Int {
        var position = 0
        var maxDistGap = 0
        var maxCanRepairCnt = 0
        
        for weakPosition in weak {
            if repairStatus[weakPosition] == false {
                let canRepair = coveredPositions(start: weakPosition, dist: friend)
                let canRepairCntWithoutDuplicate = canRepair.filter({ repairStatus[$0] == false }).sorted()
                let canRepairCnt = canRepairCntWithoutDuplicate.count
                
                if canRepairCnt >= maxCanRepairCnt {
                    if canRepairCnt >= 2 {
                        let distGap = canRepairCntWithoutDuplicate.last! - canRepairCntWithoutDuplicate.first!
                        if distGap > maxDistGap {
                            maxDistGap = distGap
                            maxCanRepairCnt = canRepairCnt
                            position = weakPosition
                        }
                    } else {
                        position = weakPosition
                        maxCanRepairCnt = canRepairCnt
                    }
                }
            }
        }
        
        return position
    }
    
    for (i, friend) in dist.enumerated() {
        let position = findProperPostion(friend: friend)
        
        let repairedPositions = coveredPositions(start: position, dist: friend)
        
        repairedPositions.forEach { repairStatus[$0] = true }
        
        if repairedCnt == weak.count {
            result = i+1
            break
        }
    }
    
    return result
}
