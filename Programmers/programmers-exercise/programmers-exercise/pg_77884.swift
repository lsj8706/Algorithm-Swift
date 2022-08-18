//
//  pg_77884.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/77884
// 약수의 개수와 덧셈

import Foundation

func solve77884() {
    print(solution(13, 17))
}

fileprivate func solution(_ left:Int, _ right:Int) -> Int {
    var res = 0
    for i in left...right {
        let numOfAliquot = getNumOfAliquot(i)
        if numOfAliquot % 2 == 0 {
            res += i
        } else {
            res -= i
        }
    }
    return res
}

func getNumOfAliquot(_ n: Int) -> Int {
    var cnt = 0
    
    for i in 1...n {
        if n % i == 0 {
            cnt += 1
        }
    }
    
    return cnt
}
