//
//  pg_150367.swift
//  programmers
//
//  Created by sejin on 2023/08/23.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/150367
//  표현 가능한 이진트리

import Foundation

func solve150367() {
    print(solution([7, 42, 5]))
//    print(solution([63, 111, 95]))
//    print(solution([128]))
}

fileprivate func solution(_ numbers:[Int64]) -> [Int] {
    var result = [Int]()
    
    for number in numbers {
        let binaryNum = String(number, radix: 2)
        let fullBinaryNum = makeFullBinaryTree(number: binaryNum)
        let canConvert = canConvertBinaryTree(num: fullBinaryNum)
        
        result.append(canConvert ? 1 : 0)
    }
    
    return result
}

// 노드의 개수와 트리의 level을 비교하여 포화 이진트리 만들기
fileprivate func makeFullBinaryTree(number: String) -> String {
    var level: Double = 0
    var nodeCnt = 1
    
    while nodeCnt < number.count {
        level += 1
        nodeCnt += Int(pow(2, level))
    }
    
    let diff = nodeCnt - number.count // 이만큼 0을 앞에 추가해줘야 한다.
    
    return String(repeating: "0", count: diff) + number
}

fileprivate func canConvertBinaryTree(num: String) -> Bool {
    if num.count <= 2 {
        return true
    }

    let middleIndex = num.index(num.startIndex, offsetBy: num.count / 2)
    let leftSubtree = String(num[num.startIndex..<middleIndex])
    let rightSubtreeStartIndex = num.index(after: middleIndex)
    let rightSubtree = String(num[rightSubtreeStartIndex..<num.endIndex])
    
    // 현재 검사중인 트리의 루트가 0인 경우
    if num[middleIndex] == "0" {
        // 서브트리가 모두 0이어야만 가능한 경우이다.
        return isSubtreeZero(subree: leftSubtree) && isSubtreeZero(subree: rightSubtree)
    }

    return canConvertBinaryTree(num: leftSubtree) && canConvertBinaryTree(num: rightSubtree)
}


// 서브트리가 전부 0으로 구성되어 있는지 확인
fileprivate func isSubtreeZero(subree: String) -> Bool {
    for num in subree {
        if num == "1" {
            return false
        }
    }
    
    return true
}
