//
//  pg_12916.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/07.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12916
// 문자열 내 p와 y의 개수

import Foundation

func solve12916() {
    print(solution("pPoooyY"))
}

fileprivate func solution(_ s:String) -> Bool
{
    var pCount = 0
    var yCount = 0
    
    for word in s {
        if word == "p" || word == "P" {
            pCount += 1
        } else if word == "y" || word == "Y" {
            yCount += 1
        }
    }
        
    let ans:Bool = pCount == yCount
    
    return ans
}
