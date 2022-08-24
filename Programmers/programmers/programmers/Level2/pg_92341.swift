//
//  pg_92341.swift
//  programmers
//
//  Created by sejin on 2022/08/24.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/92341
// 주차 요금 계산

import Foundation

func solve92341() {
    print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
}

fileprivate func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let baseTime = fees[0]
    let baseFee = fees[1]
    let unitTime = fees[2]
    let unitFee = fees[3]
    
    var dict = [String: String]()
    var totalTime = [String: Int]()
    var totalFee = [String: Int]()
    
    for record in records {
        let arr = record.components(separatedBy: " ")
        let time = arr[0]
        let carNum = arr[1]
        let description = arr[2]
        
        if description == "OUT" {
            let inTime = dict[carNum]!.components(separatedBy: ":").map { Int($0)! }
            let outTime = time.components(separatedBy: ":").map { Int($0)! }
            
            let totalMinutes = (outTime[0] - inTime[0])*60 - inTime[1] + outTime[1]
            
            totalTime[carNum] = totalTime[carNum]! + totalMinutes
            dict.removeValue(forKey: carNum)
        } else {
            dict[carNum] = time
            if !totalTime.contains(where: {$0.0 == carNum}) {
                totalTime[carNum] = 0
            }
        }
    }
    
    for (carNum, time) in dict {
        let inTime = time.components(separatedBy: ":").map { Int($0)! }
        let outTime = [23, 59]
        let totalMinutes = (outTime[0] - inTime[0])*60 - inTime[1] + outTime[1]
        
        totalTime[carNum] = totalTime[carNum]! + totalMinutes
    }
    
    for (carNum, totalMinutes) in totalTime {
        if totalMinutes <= baseTime {
            totalFee[carNum] = baseFee
        } else {
            totalFee[carNum] = baseFee + Int(ceil((Double(totalMinutes - baseTime) / Double(unitTime)))) * unitFee
        }
    }
    
    var ans = [Int]()
    
    let cars = totalFee.keys.sorted()
    
    for car in cars {
        ans.append(totalFee[car]!)
    }
    
    return ans
}
