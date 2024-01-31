//
//  pg_258709.swift
//  programmers
//
//  Created by sejin on 1/22/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/258709
//  주사위 고르기

import Foundation

func solve258709() {
    print(solution([[1, 2, 3, 4, 5, 6], [3, 3, 3, 3, 4, 4], [1, 3, 3, 4, 4, 4], [1, 1, 4, 4, 5, 5]]))
}

fileprivate func solution(_ dice:[[Int]]) -> [Int] {
    let count = dice.count
    let combinationResults = combination((0..<count).map { $0 }, count/2)
    
    var maxWinCnt = 0
    var result = [Int]()
    
    for diceForA in combinationResults {
        let diceForB = (0..<count).filter { !diceForA.contains($0) }
        let diceSumForA = getAllDiceSum(dice: diceForA.map { dice[$0] })
        let diceSumForB = getAllDiceSum(dice: diceForB.map { dice[$0] })
        
        let winCnt = calculateAWinCount(diceSumForA: diceSumForA, diceSumForB: diceSumForB)
        
        if winCnt > maxWinCnt {
            maxWinCnt = winCnt
            result = diceForA
        }
    }
    
    return result.map { $0+1 }
}

fileprivate func calculateAWinCount(diceSumForA: [Int], diceSumForB: [Int]) -> Int {
    let diceSumForB = diceSumForB.sorted()
    
    var winCnt = 0
    
    for num in diceSumForA {
        // 이분 탐색
        var lo = 0
        var hi = diceSumForB.count
        
        while lo + 1 < hi {
            let mid = (lo + hi) / 2
            let midNumInB = diceSumForB[mid]
            
            if num <= midNumInB {
                hi = mid
            } else if num > midNumInB {
                lo = mid
            }
        }
        
        winCnt += lo + 1
    }
    
    return winCnt
}

fileprivate func getAllDiceSum(dice: [[Int]]) -> [Int] {
    var res = [Int]()
    
    func recursion(index: Int, sum: Int) {
        if index == dice.count {
            res.append(sum)
            return
        }
        
        for i in 0..<6 {
            recursion(index: index+1, sum: sum + dice[index][i])
        }
    }
    
    recursion(index: 0, sum: 0)
    
    return res
}

fileprivate func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    
    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
    }
    
    return result
}
