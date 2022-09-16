//
//  pg_42583.swift
//  programmers
//
//  Created by sejin on 2022/09/16.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42583
// 다리를 지나는 트럭

import Foundation

func solve42583() {
    print(solution(2, 10, [7,4,5,6]    ))
}

fileprivate func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var res = 0
    var trucks = truck_weights
    var onBridge = Array(repeating: 0, count: bridge_length)
    var onBridgeSum = 0
    var doneCnt = 0
    
    
    while doneCnt != truck_weights.count {
        let first = onBridge.removeFirst()
        onBridgeSum -= first
        if first != 0 {
            doneCnt += 1
        }
        
        onBridge.append(0)
        
        if let truck = trucks.first {
            if onBridgeSum + truck <= weight {
                trucks.removeFirst()
                onBridge[onBridge.count-1] = truck
                onBridgeSum += truck
            }
        }
        
        res += 1
    }
    
    return res
}
