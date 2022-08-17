//
//  pg_77484.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/17.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/77484
// 로또의 최고 순위와 최저 순위

import Foundation

func solve77484() {
    print(solution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
}

fileprivate func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var zeroCnt = 0
    var matchCnt = 0
    
    lottos.forEach {
        if $0 == 0 {
            zeroCnt += 1
        } else if win_nums.contains($0) {
            matchCnt += 1
        }
    }
    
    var maxRank = 7 - (zeroCnt + matchCnt)
    var minRank = 7 - matchCnt
    
    maxRank = maxRank == 7 ? 6 : maxRank
    minRank = minRank == 7 ? 6 : minRank

    
    return [maxRank, minRank]
}
