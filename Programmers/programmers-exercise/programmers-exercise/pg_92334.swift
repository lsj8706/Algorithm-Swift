//
//  pg_92334.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/17.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/92334
// 신고 결과 받기

import Foundation

func solve92334() {
    print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
}

fileprivate func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    let reports = Set(report)
    var dict = Dictionary<String, [String]>()
    var info = Dictionary<String, Int>() // id_list를 중복하여 반복문을 돌지 않으려면 유저 이름에 맞는 인덱스를 넣을 dictionary가 필요하다.
    var reportedCnt = Array(repeating: 0, count: id_list.count)
    var res = Array(repeating: 0, count: id_list.count)
    
    
    for (idx, name) in id_list.enumerated() {
        dict[name] = []
        info[name] = idx
    }
        
    for report in reports {
        let person1 = report.components(separatedBy: " ")[0]
        let person2 = report.components(separatedBy: " ")[1]
        
        let reportedIndex = info[person2]!
        
        reportedCnt[reportedIndex] += 1
        dict[person2]?.append(person1)
    }
    
    for i in 0..<reportedCnt.count {
        if reportedCnt[i] >= k {
            let nameList = dict[id_list[i]]!
            for name in nameList {
                res[info[name]!] += 1
            }
        }
    }
    
    return res
}
