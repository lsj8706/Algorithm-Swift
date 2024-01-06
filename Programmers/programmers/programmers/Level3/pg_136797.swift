//
//  pg_136797.swift
//  programmers
//
//  Created by sejin on 1/6/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/136797
//  숫자 타자 대회

import Foundation

func solve136797() {
//    print(solution("1756"))
    print(solution("0123"))
}

fileprivate func solution(_ numbers:String) -> Int {
    let numbers = Array(numbers).map { Int(String($0))! }
    var dict = [Int: [Int]]() // key: 출발 번호, value: index 번호까지 이동하는데 최소 비용 배열
    
    for i in 0...9 {
        let weights = getMinimumWeights(from: i)
        dict[i] = weights
    }
    
    var result = Int.max

    func dfs(i: Int, leftHand: Int, rightHand: Int, total: Int) {
        if total >= result { return }
        
        if i == numbers.count {
            result = min(result, total)
            return
        }
        
        let num = numbers[i]
        
        let leftWeight = dict[leftHand]![num]
        let rightWeight = dict[rightHand]![num]
        
        if leftWeight < rightWeight {
            dfs(i: i+1, leftHand: num, rightHand: rightHand, total: total + leftWeight)
        } else if rightWeight > leftWeight {
            dfs(i: i+1, leftHand: leftHand, rightHand: num, total: total + rightWeight)
        } else {
            dfs(i: i+1, leftHand: num, rightHand: rightHand, total: total + leftWeight)
            dfs(i: i+1, leftHand: leftHand, rightHand: num, total: total + rightWeight)
        }
    }
    
    dfs(i: 0, leftHand: 4, rightHand: 6, total: 0)
    
    return result
}

fileprivate func getPosition(num: Int) -> (Int, Int) {
    if num == 0 { return (3, 1) }
    let num = num-1
    return (num/3, num%3)
}

fileprivate func getMinimumWeights(from start: Int) -> [Int] {
    let board = [[1,2,3],[4,5,6],[7,8,9], [-1, 0, -1]]
    var result = Array(repeating: Int.max, count: 10)
    let dx = [0, 0, 1, -1, -1, -1, 1, 1]
    let dy = [-1, 1, 0, 0, 1, -1, -1, 1]
    let (startX, startY) = getPosition(num: start)
    
    var queue = [(Int, Int, Int)]() // (x, y, 가중치 합)
    
    queue.append((startX, startY, 0))
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        let x = first.0
        let y = first.1
        let weight = first.2
        let num = board[x][y]
        
        result[num] = min(result[num], weight)
        
        for i in dx.indices {
            let nextX = x + dx[i]
            let nextY = y + dy[i]
            
            if nextX >= 0 && nextX < 4 && nextY >= 0 && nextY < 3 {
                let nextNum = board[nextX][nextY]
                
                if nextNum != -1, result[nextNum] == Int.max {
                    let distance = abs(dx[i]) + abs(dy[i])
                    
                    if distance == 1 { // 상하좌우
                        queue.append((nextX, nextY, weight + 2))
                    } else { // 대각선
                        queue.append((nextX, nextY, weight + 3))
                    }
                }
            }
        }
    }
    
    result[start] = 1
    
    return result
}

