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
    var order = Array(order.reversed())
    var result = 0
    let totalBoxCnt = order.count
    
    var i = 1 // 주 컨테이터에서 들어오는 박스 넘버
    
    while !order.isEmpty && i <= totalBoxCnt+1 {
        let needToStore = order.last!
        // 주 컨테이너 또는 보조 컨테이너에 해당 번호가 있을 경우 result 증가
        if i == needToStore {
            result += 1
            order.removeLast()
            i += 1
            continue
        } else if !stack.isEmpty && stack.last! == needToStore {
            result += 1
            stack.removeLast()
            order.removeLast()
            continue
        }
        
        // 둘 다에서 못찾을 경우 보조 컨테이너 (stack)에 추가
        stack.append(i)
        i += 1
    }
    
    return result
}

// order를 그대로 사용하면 removeFirst를 사용해야 하는데 이 함수의 시간복잡도가 O(n)이라 시간 초과가 발생한다.
// 따라서 order를 reversed()하여 스택으로 바꾼 후 removeLast를 사용하는 방식으로 시간 초과 문제를 해결했다.
