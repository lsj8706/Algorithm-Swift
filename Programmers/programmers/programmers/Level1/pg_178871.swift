//
//  pg_178871.swift
//  programmers
//
//  Created by sejin on 2023/11/08.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/178871
//  달리기 경주

import Foundation

func solve178871() {
    print(solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"]))
}

fileprivate func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    var dict = [String: Int]() // key: 이름, value: 인덱스
    
    for i in players.indices {
        dict[players[i]] = i
    }
    
    for calling in callings {
        let index = dict[calling]!
        let prevPreson = players[index-1]
        players.swapAt(index-1, index)
        dict[calling]! -= 1
        dict[prevPreson]! += 1
    }
    
    return players
}

