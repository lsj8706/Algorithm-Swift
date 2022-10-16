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
    print(solution("ababcdcdababcdcd"    ))
}


fileprivate func solution(_ s:String) -> Int {
    var ans = s.count
    let s = Array(s)
    
    for i in 1..<s.count {
        var res = [String]()
        var temp = [String]()
        var cnt = 0
        for j in 0..<s.count {
            if temp.count < i {
                temp.append(String(s[j]))
                res.append(String(s[j]))
                continue
            }
            if cnt > 0 {
                cnt -= 1
                continue
            }
            if j+i-1 < s.count, temp == Array(s[j...(j+i-1)]).map({String($0)}) {
                cnt = i - 1
                if let last = Int(res.last!) {
                    res[res.count - 1] = String(last + 1)
                } else {
                    res.append("2")
                }
            } else {
                temp.removeAll()
                temp.append(String(s[j]))
                res.append(String(s[j]))
            }
        }
        
        if res.joined().count < ans {
            ans = res.joined().count
        }
    }
    
    return ans
}
