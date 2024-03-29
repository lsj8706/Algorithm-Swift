//
//  pg_152995.swift
//  programmers
//
//  Created by sejin on 2023/08/11.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/152995
//  인사고과

import Foundation

func solve152995() {
    print(solution([[2,2],[1,4],[3,2],[3,1],[2,1]]))
//    print(solution([[4, 0], [2, 5], [5, 3], [2, 6]]))
//    print(solution([[4,1],[2,4],[3,5]]))
//    print(solution([[100,1],[100,2],[50,1]]))
}

fileprivate func solution(_ scores:[[Int]]) -> Int {
    let target = scores[0] // 완호의 점수
    
    let attitudeScoreAscendingSorted = scores.sorted(by: { $0[0] > $1[0] || ($0[0] == $1[0] && $0[1] < $1[1]) })
    var maxPeerEvaluationScore = attitudeScoreAscendingSorted.first![1]
    
    var peopleCanGetIncentive = [[Int]]()
    
    for score in attitudeScoreAscendingSorted {
        if maxPeerEvaluationScore > score[1] {
            if score == target { return -1 }
            continue
        } else {
            peopleCanGetIncentive.append(score)
        }
        maxPeerEvaluationScore = max(maxPeerEvaluationScore, score[1])
    }
    
    let overallScore = peopleCanGetIncentive.map { $0[0] + $0[1] }.sorted(by: >)

    guard let ranking = overallScore.firstIndex(of: target.reduce(0, +)) else {
        return -1
    }
    
    return ranking + 1
}
