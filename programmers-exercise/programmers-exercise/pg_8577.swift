//
//  pg_8577.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/04.
//
// https://programmers.co.kr/app/with_setting/tests/47182/challenges/algorithms/8577
// 2022 토스 NEXT iOS Part 1 테스트 문제
// 보안 키패드

import Foundation

func solve8577() {
    print(solution(4, [3, 1, -1, 9, -1, -1, 9, 8, 2, 8, 6, 4, 4, -2, 1, 1, 3, 0, -1, 6]))
}


func solution(_ n:Int, _ keyInputs:[Int]) -> String {
    var res = ""
    for key in keyInputs {
        if key == -2 {
            res.removeAll()
        } else if key == -1 {
            let _ = res.popLast()
        } else {
            if res.count == n {
                continue
            }
            res.append(String(key))
        }
    }
    
    return res.count < n ? "" : String(res.prefix(n))
}
