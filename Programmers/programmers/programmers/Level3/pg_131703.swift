//
//  pg_131703.swift
//  programmers
//
//  Created by sejin on 2023/10/10.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/131703
//  2차원 동전 뒤집기

import Foundation

func solve131703() {
    print(solution([[0, 1, 0, 0, 0], [1, 0, 1, 0, 1], [0, 1, 1, 1, 0], [1, 0, 1, 1, 0], [0, 1, 0, 1, 0]], [[0, 0, 0, 1, 1], [0, 0, 0, 0, 1], [0, 0, 1, 0, 1], [0, 0, 0, 1, 0], [0, 0, 0, 0, 1]]))
//    print(solution([[0, 0, 0], [0, 0, 0], [0, 0, 0]], [[1, 0, 1], [0, 0, 0], [0, 0, 0]]))
}

fileprivate func solution(_ beginning: [[Int]], _ target: [[Int]]) -> Int {
    let maxVal = beginning.count * beginning[0].count + 1
    var answer = maxVal

    for row in 0..<Int(pow(2, Double(beginning.count))) {
        for col in 0..<Int(pow(2, Double(beginning[0].count))) {
            let rowConvertCnt = String(row, radix: 2).filter { $0 == "1" }.count
            let colConvertCnt = String(col, radix: 2).filter { $0 == "1" }.count
            let cnt = rowConvertCnt + colConvertCnt
            if cnt < answer && compare(beginning, target, row, col) {
                answer = cnt
            }
        }
    }

    return answer < maxVal ? answer : -1
}

fileprivate func compare(_ beginning: [[Int]], _ target: [[Int]], _ row: Int, _ col: Int) -> Bool {
    for r in 0..<beginning.count {
        for c in 0..<beginning[0].count {
            let diff = ((row >> r) & 1 + ((col >> c) & 1)) % 2
            if (beginning[r][c] + diff) % 2 != target[r][c] {
                return false
            }
        }
    }
    return true
}
