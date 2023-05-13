//
//  pg_131704.swift
//  programmers
//
//  Created by sejin on 2023/05/13.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/131704
//  택배상자

import Foundation

func solve131704() {
    print(solution([5, 4, 3, 2, 1]))
}

fileprivate func solution(_ order:[Int]) -> Int {
    var stack = [Int]() // 보조 컨테이너 벨트
    var order = order
    var result = 0
    let totalBoxCnt = order.count
    
    var i = 1 // 들어오는 박스 넘버
    
    while !order.isEmpty && i <= totalBoxCnt+1 {
        let needToStore = order.first!
        // 주 컨테이너 또는 보조 컨테이너에 해당 번호가 있을 경우 result 증가
        if i == needToStore {
            result += 1
            order.removeFirst()
            i += 1
            continue
        } else if !stack.isEmpty && stack.last! == needToStore {
            result += 1
            stack.removeLast()
            order.removeFirst()
            continue
        }
        
        // 둘 다에서 못찾을 경우 보조 컨터이너 (stack)에 추가
        stack.append(i)
        i += 1
    }
    
    return result
}
