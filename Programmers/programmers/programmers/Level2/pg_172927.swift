//
//  pg_172927.swift
//  programmers
//
//  Created by sejin on 2023/06/10.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/172927
//  광물 캐기

import Foundation

func solve172927() {
    print(solution([0, 1, 1], ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"]))
}

fileprivate func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var result = Int.max
    
    let minerals = minerals.map { Mineral(rawValue: $0)! }
    let picksDict: [Pickax: Int] = [.diamond: picks[0], .iron: picks[1], .stone: picks[2]]
    let r = Int(ceil(Double(minerals.count) / Double(5))) // 필요한 곡괭의 개수
    
    let picksCases: [[Pickax]] = getCases(dict: picksDict, r: r)
        
    for picksCase in picksCases {
        var fatigue = 0
        var i = 0 // 지금까지 캔 광물 인덱스
        for pick in picksCase {
            var cnt = 0 // 이 곡괭이로 캔 광물의 개수
            while cnt < 5 {
                if i+cnt >= minerals.count { break }
                fatigue += pick.consumingFatigue(for: minerals[i+cnt])
                cnt += 1
            }
            i += cnt
        }
        
        result = min(result, fatigue)
    }
    
    
    return result
}

/// 가능한 곡괭이의 경우의 수 구하기
fileprivate func getCases(dict: [Mineral: Int], r: Int) -> [[Mineral]] {
    var dict = dict
    var result = [[Mineral]]()
    
    func dfs(now: [Mineral]) {
        if now.count == r || dict.values.reduce(0, +) == 0 {
            result.append(now)
            return
        }
        
        for key in dict.keys {
            if dict[key] == 0 { continue }
            dict[key] = dict[key]! - 1
            dfs(now: now + [key])
            dict[key] = dict[key]! + 1
        }
    }
    
    dfs(now: [])
    
    return result
}

fileprivate enum Mineral: String {
    case diamond
    case iron
    case stone
    
    func consumingFatigue(for mineral: Mineral) -> Int {
        switch self {
        case .diamond:
            return 1
        case .iron:
            if mineral == .diamond { return 5 }
            return 1
        case .stone:
            switch mineral {
            case .diamond:
                return 25
            case .iron:
                return 5
            case .stone:
                return 1
            }
        }
    }
}

fileprivate typealias Pickax = Mineral
