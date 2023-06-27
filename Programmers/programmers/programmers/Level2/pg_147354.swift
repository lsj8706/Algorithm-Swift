//
//  pg_147354.swift
//  programmers
//
//  Created by sejin on 2023/06/27.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/147354
//  테이블 해시 함수

import Foundation

func solve147354() {
    print(solution([[2,2,6],[1,5,10],[4,2,9],[3,8,3]], 2, 2, 3))
}

fileprivate func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    var result = 0
    
    let data = data.sorted {
        if $0[col-1] == $1[col-1] {
            return $0[0] > $1[0]
        } else {
            return $0[col-1] < $1[col-1]
        }
    }
    
    func getSi(i: Int) -> Int {
        return data[i-1].reduce(0) { partialResult, num in
            partialResult + num % i
        }
    }
    
    for i in row_begin...row_end {
        result = result ^ getSi(i: i)
    }
    
    return result
}
