//
//  pg_42888.swift
//  programmers
//
//  Created by sejin on 2022/09/27.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42888
// 오픈채팅방

import Foundation

func solve42888() {
    print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]    ))
}

fileprivate func solution(_ record:[String]) -> [String] {
    var dict = [String: String]() // uid와 닉네임 매핑
    var uidResult = [[String]]() // 누적되는 기록을 action과 uid만 저장
    var ans = [String]()
    
    for info in record {
        let arr = info.components(separatedBy: " ")
        let action = arr[0]
        let uid = arr[1]
        
        switch action {
        case "Enter":
            let name = arr[2]
            dict[uid] = name
            uidResult.append(["Enter", uid])
        case "Leave":
            uidResult.append(["Leave", uid])
        case "Change":
            let name = arr[2]
            dict[uid] = name
        default:
            break
        }
    }
    
    for uidRes in uidResult {
        let action = uidRes[0]
        let uid = uidRes[1]
        let name = dict[uid]!
        
        if action == "Enter" {
            ans.append("\(name)님이 들어왔습니다.")
        } else {
            ans.append("\(name)님이 나갔습니다.")
        }
    }
    
    return ans
}
