//
//  pg_12915.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/08.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12915
// 문자열 내 마음대로 정렬하기


import Foundation

func solve12915() {
    print(solution(["sun", "bed", "car"], 1))
}

fileprivate func solution(_ strings:[String], _ n:Int) -> [String] {
    let ans = strings.sorted {
        let index = $0.index($0.startIndex, offsetBy: n)
        if $0[index] == $1[index] {
            return $0 < $1
        }
        return $0[index] < $1[index]
    }
    return ans
}
