//
//  pg_118666.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/18.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/118666
// 성격 유형 검사하기

import Foundation

func solve118666() {
    print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
}

fileprivate func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A":0, "N": 0]
    var res = ""
    
    for i in 0..<survey.count {
        let first = String(survey[i].first!)
        let second = String(survey[i].last!)
        
        switch choices[i] {
        case 1...3:
            dict[first] = dict[first]! + 4 - choices[i]
        case 5...7:
            dict[second] = dict[second]! + choices[i] - 4
        default:
            break
        }
    }
    
    let testResults = [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]]
    for result in testResults {
        dict[result[0]]! >= dict[result[1]]! ? res.append(result[0]) : res.append(result[1])
    }
    
    return res
}
