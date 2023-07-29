//
//  pg_77486.swift
//  programmers
//
//  Created by sejin on 2023/07/29.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/77486
//  다단계 칫솔 판매

import Foundation

func solve77486() {
    print(solution(["john", "mary", "edward", "sam", "emily", "jaimie", "tod", "young"], ["-", "-", "mary", "edward", "mary", "mary", "jaimie", "edward"], ["young", "john", "tod", "emily", "mary"], [12, 4, 2, 5, 10]))
}

fileprivate func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var resultDict = [String: Int]()    // key: 판매원 이름, value: 이익금
    var graph = [String: String]() // Key: 판매원 이름, value: 판매원을 참여시킨 추천인 이름
    
    for i in 0..<enroll.count {
        let person = enroll[i]
        resultDict[person] = 0
        graph[person] = referral[i]
    }
    
    // 이익을 분배하는 함수 (추천인들에게도 10퍼센트씩 분배)
    func distributeProfits(name: String, profits: Int) {
        if profits < 1 {
            return
        }
        
        // 이익 계산
        let profitsForParent = profits / 10
        let currentSellerProfit = profits - profitsForParent
        
        resultDict[name, default: 0] += currentSellerProfit
        
        let parent = graph[name]! // parent는 추천인을 의미

        if parent != "-" {
            distributeProfits(name: parent, profits: profitsForParent)
        }
    }
    
    for i in 0..<seller.count {
        let sellerName = seller[i]
        let profits = amount[i] * 100
        
        distributeProfits(name: sellerName, profits: profits)
    }
    
    var result = [Int]()
    
    for name in enroll {
        let profits = resultDict[name]!
        result.append(profits)
    }
    
    return result
}
