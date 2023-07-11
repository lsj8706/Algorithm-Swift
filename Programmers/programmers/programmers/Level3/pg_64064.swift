//
//  pg_64064.swift
//  programmers
//
//  Created by sejin on 2023/07/11.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/64064
//  불량 사용자

import Foundation

func solve64064() {
    print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))
}

fileprivate func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = Set<Set<String>>()   // 가능한 경우의 수들이 들어갈 집합 (각 경우의 수도 집합으로 관리)
    
    var matchDict = [Int: [String]]() // key: banId의 index, value: 매칭되는 userIds 어레이
    
    for (i, banId) in banned_id.enumerated() {
        matchDict[i] = findMatchingId(userIds: user_id, banId: banId)
    }
    
    func dfs(level: Int, ids: Set<String>) {
        if level != ids.count { return }
        
        if level == banned_id.count {
            result.insert(ids)
            return
        }
        
        for matchId in matchDict[level]! {
            dfs(level: level+1, ids: ids.union([matchId]))
        }
    }
    
    dfs(level: 0, ids: [])
    
    return result.count
}

/// banId에 해당할 수 있는 userId 어레이 반환
fileprivate func findMatchingId(userIds: [String], banId: String) -> [String] {
    var ids = [String]()
    
    outer: for userId in userIds {
        if userId.count != banId.count { continue }
        
        for idx in banId.indices {
            if userId[idx] != banId[idx] && banId[idx] != "*" {
                continue outer
            }
        }
        
        ids.append(userId)
    }
    
    return ids
}
