//
//  pg_87946.swift
//  programmers
//
//  Created by sejin on 2023/02/21.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/87946
// 피로도

import Foundation

func solve87946() {
    print(solution(80, [[80,20],[50,40],[30,10]]))
}

fileprivate func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    let tempArray = Array(0...dungeons.count-1)
    let permutatedIndexArray = permutation(tempArray, dungeons.count) // dungeons 어레이의 모든 정렬의 경우의 수를 구하기 위한 순열 사용 (인덱스를 순열)
    
    for indexArray in permutatedIndexArray {
        var fatigability = k
        var count = 0
        for index in indexArray {
            let minFatigability = dungeons[index][0]
            let cost = dungeons[index][1]
            
            if fatigability >= minFatigability {
                fatigability -= cost
                count += 1
            } else {
                break
            }
        }
        
        if count > result {
            result = count
        }
    }
    
    return result
}

fileprivate func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var stack: [([T], [Bool])] = array.enumerated().map {
        var visited = Array(repeating: false, count: array.count)
        visited[$0.offset] = true
        return ([$0.element], visited)
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let elements = now.0
        var visited = now.1
        
        if elements.count == n {
            result.append(elements)
            continue
        }
        
        for i in 0...array.count-1 {
            if visited[i] { continue }
            visited[i] = true
            stack.append((elements + [array[i]], visited))
            visited[i] = false
        }
    }
    
    return result
}
