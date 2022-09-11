//
//  pg_17677.swift
//  programmers
//
//  Created by sejin on 2022/09/11.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17677
// 뉴스 클러스터링

import Foundation

func solve17677() {
    print(solution("BAAAA", "AAA"))
}

fileprivate func solution(_ str1:String, _ str2:String) -> Int {
    let arrA = Array(str1.lowercased())
    let arrB = Array(str2.lowercased())
    
    var a = [String]()
    var b = [String]()
    
    for i in 0..<arrA.count-1 {
        if arrA[i].isLetter && arrA[i+1].isLetter{
            a.append("\(arrA[i])\(arrA[i+1])")
        }
    }
    
    for i in 0..<arrB.count-1 {
        if arrB[i].isLetter && arrB[i+1].isLetter{
            b.append("\(arrB[i])\(arrB[i+1])")
        }
    }

    let ans = jaccard(a, b) * 65536
    
    return Int(ans)
}

fileprivate func jaccard(_ a: [String], _ b: [String]) -> Double {
    if a.isEmpty && b.isEmpty {
        return 1
    }
    let intersectionCnt = intersection(a, b)
    
    let res = Double(intersectionCnt) / Double(union(a, b, intersectionCnt))
    
    return res
}

fileprivate func intersection(_ a: [String], _ b: [String]) -> Int {
    var cnt = 0
    var small = a
    var big = b
    
    if b.count < a.count {
        small = b
        big = a
    }
    
    for x in small {
        if let index = big.firstIndex(of: x) {
            big.remove(at: index)
            cnt += 1
        }
    }
    
    return cnt
}

fileprivate func union(_ a: [String], _ b: [String], _ intersectionCnt: Int) -> Int {
    let cnt = a.count + b.count - intersectionCnt
    
    return cnt
}
