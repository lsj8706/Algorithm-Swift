//
//  pg_42890.swift
//  programmers
//
//  Created by sejin on 2022/09/28.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/42890
// 후보키

import Foundation

func solve42890() {
    print(solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]))
}

fileprivate func solution(_ relation:[[String]]) -> Int {
    let col = relation[0].count
    let row = relation.count
    var candidateKeys = [[Int]]() // 후보키로 예상되는 col 조합 (중복 제거 전)
    
    for i in 1...col {

        let arr = Array(0...col-1)
        let combinationResults = combination(arr, i)
        
        for combiRes in combinationResults {
            var set = Set<[String]>()
            for person in relation {
                var temp = [String]()
                for idx in combiRes {
                    temp.append(person[idx])
                }
                set.insert(temp)
            }
            if set.count == row {
                candidateKeys.append(combiRes)
            }
        }
    }
    
    var ans = candidateKeys.count
    var filterdCandidateKeys = [[Int]]()
    
    for candidateKey in candidateKeys {
        var isValid = true
        for key in filterdCandidateKeys {
            if Set(key).isSubset(of: Set(candidateKey)) {
                ans -= 1
                isValid = false
                break
            }
        }
        
        if isValid {
            filterdCandidateKeys.append(candidateKey)
        }
    }
    
    return ans
}

func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0, [])
    
    return result
}
