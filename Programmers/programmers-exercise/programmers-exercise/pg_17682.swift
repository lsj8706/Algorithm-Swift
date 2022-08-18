//
//  pg_17682.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/08.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17682
// 다트 게임

import Foundation

func solve17682() {
    print(solution("10D4S10D"))
}

fileprivate func solution(_ dartResult:String) -> Int {
    var ans = [Int]()
    
    for (i, n) in dartResult.enumerated() {
        if let num = Int(String(n)) {
            if i >= 1 && num == 0 && Array(dartResult)[i-1] == "1" {
                ans[ans.count-1] = 10
            } else {
                ans.append(num)
            }
        } else {
            switch String(n) {
            case "S":
                break
            case "D":
                let n: Float = Float(ans[ans.count-1])
                ans[ans.count-1] = Int(pow(n, 2))
            case "T":
                let n: Float = Float(ans[ans.count-1])
                ans[ans.count-1] = Int(pow(n, 3))
            case "*":
                ans[ans.count-1] *= 2
                if ans.count >= 2 {
                    ans[ans.count-2] *= 2
                }
            case "#":
                ans[ans.count-1] *= -1
            default:
                break
            }
        }
    }
    
    return ans.reduce(0, +)
}
