//
//  pg_43164.swift
//  programmers
//
//  Created by sejin on 2023/07/19.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/43164
//  여행경로

import Foundation

func solve43164() {
//    print(solution([["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]))
    print(solution([["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]))
}

fileprivate func solution(_ tickets:[[String]]) -> [String] {
    
    var dict = [String: [String]]() // key: 출발 공항, value: 도착 공항
    
    for ticket in tickets {
        dict[ticket[0], default: []].append(ticket[1])
    }
    
    var visited = [String: [Bool]]() // key: 출발 공항, value: 도착 공항을 방문한 적이 있는지 기록
    
    for key in dict.keys {
        dict[key]?.sort()
        visited[key] = Array(repeating: false, count: dict[key]!.count)
    }
    
    var result = [String]()
    
    func dfs(departure: String, now: [String]) {
        if !result.isEmpty {
            return
        }
        
        if now.count == tickets.count + 1 {
            result = now
            return
        }
        
        let arrivals = dict[departure, default: []]
        
        for (index, arrival) in arrivals.enumerated() {
            if visited[departure]![index] == false {
                visited[departure]![index] = true
                dfs(departure: arrival, now: now + [arrival])
                visited[departure]![index] = false
            }
        }
    }
    
    dfs(departure: "ICN", now: ["ICN"])
    
    return result
}
