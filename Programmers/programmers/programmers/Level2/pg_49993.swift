//
//  pg_49993.swift
//  programmers
//
//  Created by sejin on 2022/09/05.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/49993
// 스킬트리

import Foundation

func solve49993() {
    print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
}

fileprivate func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var ans = 0
    let skill = Array(skill)
    
    for skill_tree in skill_trees {
        var temp = skill
        var isValid = true
        skill_tree.forEach {
            if skill.contains($0) {
                if $0 == temp[0] {
                    temp.removeFirst()
                } else {
                    isValid = false
                    return
                }
            }
        }
        if isValid {
            ans += 1
        }
    }
    
    return ans
}
