//
//  pg_42746.swift
//  programmers
//
//  Created by sejin on 2022/09/21.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42746
// 가장 큰 수

import Foundation

func solve42746() {
    print(solution([0, 00]))
}

fileprivate func solution(_ numbers:[Int]) -> String {
    let res = numbers.map{ String($0) }.sorted {
        $0+$1 > $1+$0
    }
    
    var ans = res.joined().drop {
        $0 == "0"
    }
    
    if ans.count == 0 {
        ans = "0"
    }
    
    return String(ans)
}
