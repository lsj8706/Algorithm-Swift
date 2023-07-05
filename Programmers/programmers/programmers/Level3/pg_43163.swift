//
//  pg_43163.swift
//  programmers
//
//  Created by sejin on 2023/07/05.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/43163
//  단어 변환

import Foundation

func solve43163() {
    print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
}

fileprivate func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = Int.max
    
    func bfs() {
        var queue = [String]()
        var step = Array(repeating: 0, count: words.count)  // 각 단어까지 접근하기 위한 단계를 저장
        
        queue.append(begin)
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            
            if first == target {
                result = min(result, step[words.firstIndex(of: first)!])
                return
            }
            
            for (i, word) in words.enumerated() {
                if step[i] != 0 { continue }
                if isOneAlphabetDifference(word1: first, word2: word) {
                    if let firstIndex = words.firstIndex(of: first) {
                        step[i] = step[firstIndex] + 1
                    } else {
                        step[i] = 1
                    }
                    
                    queue.append(word)
                }
            }
        }
    }
    
    bfs()
    
    return result == Int.max ? 0 : result
}

// 두 단어가 알파벳 하나 차이인지 체크
fileprivate func isOneAlphabetDifference(word1: String, word2: String) -> Bool {
    var diffCnt = 0
    for i in word1.indices {
        if word1[i] != word2[i] { diffCnt += 1 }
        if diffCnt > 1 { return false }
    }
    
    return diffCnt == 1 ? true : false
}
