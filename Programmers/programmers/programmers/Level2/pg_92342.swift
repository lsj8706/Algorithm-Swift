//
//  pg_92342.swift
//  programmers
//
//  Created by sejin on 2022/08/19.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/92342
// 양궁대회

import Foundation

func solve92342() {
    print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
}

fileprivate func solution(_ n:Int, _ info:[Int]) -> [Int] {
        
    var biggestScoreGap = 0
    var res = Array(repeating: 0, count: 11)
    
    func cycle(_ sum: Int, _ now: [Int]) {
        
        if now.count == info.count - 1 {
            let ryan = now + [n-sum]
            let scoreGap = getScoreGap(ryan, info)
            if scoreGap > biggestScoreGap {
                biggestScoreGap = scoreGap
                res = ryan
            } else if scoreGap == biggestScoreGap {
                let ryanReversed: [Int] = ryan.reversed()
                let resReversed: [Int] = res.reversed()
                
                for i in 0..<ryanReversed.count {
                    if ryanReversed[i] > resReversed[i] {
                        res = ryan
                        break
                    } else if ryanReversed[i] == resReversed[i] {
                        continue
                    } else {
                        break
                    }
                }
            }
            return
        }
        
        for i in 0...(n-sum) {
            cycle(sum+i, now + [i])
        }
    }

    func getScoreGap(_ ryan: [Int], _ info: [Int]) -> Int {
        var ryanScore = 0
        var apeachScore = 0
        
        for i in 0..<ryan.count {
            if ryan[i] > info[i] {
                ryanScore += 10 - i
            } else {
                if info[i] == 0 {
                    continue
                }
                apeachScore += 10 - i
            }
        }
        
        return ryanScore - apeachScore
    }
            
    cycle(0, [])
    
    if biggestScoreGap <= 0 {
        res = [-1]
    }
    
    return res
}
