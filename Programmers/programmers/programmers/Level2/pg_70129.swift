//
//  pg_70129.swift
//  programmers
//
//  Created by sejin on 2023/02/16.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/70129
// 이진 변환 반복하기

import Foundation

func solve70129() {
    print(solution("110010101001"))
}

private func solution(_ s:String) -> [Int] {
    var s = s
    var binaryConvertCount = 0
    var removedZeroCount = 0

    while s != "1" {
        let originStrCount = s.count
        s.removeAll(where: { $0 == "0" })
        removedZeroCount += originStrCount - s.count
        s = String(s.count, radix: 2)
        binaryConvertCount += 1
    }
    
    return [binaryConvertCount, removedZeroCount]
}
