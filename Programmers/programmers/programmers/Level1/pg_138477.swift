//
//  pg_138477.swift
//  programmers
//
//  Created by sejin on 2023/01/30.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/138477
// 명예의 전당 (1)

import Foundation

func solve138477() {
    print(solution(3, [10, 100, 20, 150, 1, 100, 200]))
}

fileprivate struct HallOfFrame {
    var ranking = [Int]()
    var announcementScore = [Int]()
    var lowestScore: Int {
        ranking.first ?? 0
    }
    
    mutating func insertNewScore(k: Int, score: Int) {
        if ranking.count < k {
            ranking.append(score)
        } else if score > lowestScore {
            ranking.removeFirst()
            ranking.append(score)
        } else {
            announcementScore.append(lowestScore)
            return
        }
        
        ranking.sort()
        announcementScore.append(lowestScore)
    }
}

fileprivate func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var hallOfFrame = HallOfFrame()
    
    for dailyScore in score {
        hallOfFrame.insertNewScore(k: k, score: dailyScore)
    }
    
    return hallOfFrame.announcementScore
}
