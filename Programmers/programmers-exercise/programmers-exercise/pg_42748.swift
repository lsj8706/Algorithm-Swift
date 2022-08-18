//
//  pg_42748.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/13.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42748
// K번째수

import Foundation

func solve42748() {
    print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
}

fileprivate func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var res = [Int]()
    
    for command in commands {
        let i = command[0]
        let j = command[1]
        let k = command[2]
        
        let slicedArray = array[i-1..<j].sorted()
        res.append(slicedArray[k-1])
    }

    return res
}
