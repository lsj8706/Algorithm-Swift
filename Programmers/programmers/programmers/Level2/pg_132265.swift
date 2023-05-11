//
//  pg_132265.swift
//  programmers
//
//  Created by sejin on 2023/05/11.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/132265
//  롤 케이크 자르기

import Foundation

func solve132265() {
    print(solution([1, 2, 1, 3, 1, 4, 1, 2]))
}

fileprivate func solution(_ topping:[Int]) -> Int {
    var result: Int = 0
    
    // 한명이 전체 토핑을 다 가졌을 때 각 토핑별 개수
    var totalDict = [Int: Int]()
    var toppingKindOfFirstPerson = Set<Int>() // firstPerson이 처음에 토핑을 독점
    var toppingKindOfSecondPerson = Set<Int>()
    
    for top in topping {
        totalDict[top, default: 0] += 1
        toppingKindOfFirstPerson.insert(top)
    }
        
    for top in topping {
        // secondPerson이 토핑을 하나씩 가져감
        totalDict[top]! -= 1
        toppingKindOfSecondPerson.insert(top)
        
        if totalDict[top]! == 0 {
            // 서로 가지고 있는 토핑 종류의 개수 변동 발생
            toppingKindOfFirstPerson.remove(top)
        }

        if toppingKindOfFirstPerson.count == toppingKindOfSecondPerson.count {
            result += 1
        }
    }
    
    return result
}

// 처음에는 topping 어레이의 인덱스를 for문을 돌며 해당 인덱스를 기준으로 두개의 어레이로 나누고
// 나누어진 두 어레이를 Set으로 만들어 Set.count로 비교를 하는 로직이었으나 시간 초과가 발생했다.
// 반복문 안에서 계속 Set을 생성하는 과정에서 시간이 오래 소요된 것으로 보인다.
// 따라서 미리 2개의 Set을 만들어 두고 토핑 종류 개수의 변화가 생기는 시점에 해당 Set을 갱신하는 방식을 사용했다.
