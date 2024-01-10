//
//  pg_258712.swift
//  programmers
//
//  Created by sejin on 1/10/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/258712
//  가장 많이 받은 선물

import Foundation

func solve258712() {
    print(solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"]))
}

fileprivate func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var friendIndex = [String: Int]()
    var giftHistory = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var giftIndex = [Int: Int]() // 선물 지수
    
    for (i, friend) in friends.enumerated() {
        friendIndex[friend] = i
        giftIndex[i] = 0
    }
    
    for gift in gifts {
        let giftData = gift.split(separator: " ").map { String($0) }
        let sender = giftData[0]
        let receiver = giftData[1]
        
        let senderIndex = friendIndex[sender]!
        let receiverIndex = friendIndex[receiver]!
        
        giftHistory[senderIndex][receiverIndex] += 1
        
        giftIndex[senderIndex, default: 0] += 1
        giftIndex[receiverIndex, default: 0] -= 1
    }
    
    var results = Array(repeating: 0, count: friends.count)
        
    for i in giftHistory.indices {
        for j in giftHistory[0].indices {
            if i == j { continue }
            
            let sendCount = giftHistory[i][j]
            let receiveCount = giftHistory[j][i]
            
            if sendCount > receiveCount {
                results[i] += 1
            } else if sendCount == receiveCount {
                // 선물 지수 확인
                if giftIndex[i]! > giftIndex[j]! {
                    results[i] += 1
                }
            }
        }
    }
        
    return results.max()!
}
