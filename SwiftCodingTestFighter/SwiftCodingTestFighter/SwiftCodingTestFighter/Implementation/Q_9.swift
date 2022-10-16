//
//  Q_9.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/16.
//
// page 323
// 문자열 압축

import Foundation

func solveQ_9() {
    print(solution("xababcdcdababcdcd"))
}


fileprivate func solution(_ s:String) -> Int {
    var ans = s.count
    let s = Array(s)
    
    for i in 1..<s.count {
        var res = [Character]()
        var temp = [Character]()
        var cnt = 0
        for j in 0..<s.count {
            if temp.count < i {
                temp.append(s[j])
                res.append(s[j])
                continue
            }
            if cnt > 0 {
                cnt -= 1
                continue
            }
            if j+i-1 < s.count, temp == Array(s[j...(j+i-1)]) {
                cnt = i - 1
                if !res.last!.isNumber {
                    res.append("1")
                }
            } else {
                temp.removeFirst()
                temp.append(s[j])
                res.append(s[j])
            }
        }
        
        if res.count < ans {
            ans = res.count
            print(res)
        }
    }
    
    return ans
}
