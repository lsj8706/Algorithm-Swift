//
//  pg_17681.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/09.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17681
// 비밀지도

import Foundation

func solve17681() {
    print(solution(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
}

fileprivate func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for i in arr1 {
        answer.append(decimalToBinary(n, i).replacingOccurrences(of: "1", with: "#").replacingOccurrences(of: "0", with: " "))
    }
    
    for j in 0..<arr2.count {
        let binaryResult = decimalToBinary(n, arr2[j]).replacingOccurrences(of: "1", with: "#")
            .replacingOccurrences(of: "0", with: " ")
        answer[j] = compare(answer[j], binaryResult)
    }
    
    return answer
}

func decimalToBinary(_ n: Int, _ num: Int) -> String {
    var res = String(num, radix: 2)
    res = String(repeating: "0", count: n-res.count) + res
    return res
}

func compare(_ a: String, _ b: String) -> String {
    var res = ""
    for i in zip(a, b) {
        if i.0 == "#" || i.1 == "#" {
            res.append("#")
        } else {
            res.append(" ")
        }
    }
    return res
}
