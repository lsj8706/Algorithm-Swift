//
//  pg_17684.swift
//  programmers
//
//  Created by sejin on 2022/08/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17684
// 압축

import Foundation

func solve17684() {
    print(solution("KAKAO"))
}

fileprivate func solution(_ msg:String) -> [Int] {
    let str = "abcdefghijklmnopqrstuvwxyz"
    let characterArray = Array(str.uppercased())
    
    var index = 1
    var dict = [String : Int]()
    for c in characterArray {
        dict[String(c)] = index
        index += 1
    }
    
    var res = [Int]()
    
    let arr = Array(msg).map { String($0) }
    var temp = ""
    for i in 0..<arr.count {
        temp += arr[i]
        if let _ = dict[temp] {
            continue
        } else {
            dict[temp] = index
            index += 1
            let last = temp.popLast()!
            res.append(dict[temp]!)
            temp = String(last)
        }
    }
    
    if !temp.isEmpty {
        res.append(dict[temp]!)
    }
    
    return res
}
