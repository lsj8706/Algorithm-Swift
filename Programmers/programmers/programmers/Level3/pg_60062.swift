//
//  pg_60062.swift
//  programmers
//
//  Created by sejin on 2023/08/17.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/60062
//  외벽 점검

import Foundation

func solve60062() {
    print(solution(12, [1, 5, 6, 10], [1, 2, 3, 4]))
//    print(solution(12, [1, 3, 4, 9, 10], [3, 5, 7]))
//    print(solution(200, [0, 10, 50, 80, 120, 160], [1, 10, 5, 40, 30]))
}

fileprivate func solution(_ n:Int, _ weak:[Int], _ dist:[Int]) -> Int {
    var extendedWeak = weak
    weak.forEach { extendedWeak.append($0+n) }
        
    var result = dist.count + 1
    
    let permutationResults = permutation(dist, dist.count)
    
    print(permutationResults)

    for i in 0..<weak.count {
        var start = [Int]()
        for j in i..<(i+weak.count) {
            start.append(extendedWeak[j])
        }
        
        for friends in permutationResults {
            var cnt = 1 // 필요한 친구의 수
            var coverLength = start[0] + friends[0]
            
            for k in 0..<weak.count {
                // 해당 친구가 커버할 수 있는 범위를 넘은 지점이 있는 경우
                if start[k] > coverLength {
                    cnt += 1    // 다음 친구를 불러옴
                    if cnt > friends.count {   // 친구의 수보다 더 사람이 필요한 경우 -> 불가능하기 때문에 탐색 중지
                        break
                    }
                    coverLength = start[k] + friends[cnt-1]
                }
            }
            
            result = min(result, cnt)
        }
    }
    
    if result > dist.count {
        return -1
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
