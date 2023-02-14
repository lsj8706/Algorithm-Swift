//
//  pg_155652.swift
//  programmers
//
//  Created by sejin on 2023/02/14.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/155652
// 둘만의 암호

import Foundation

func solve155652() {
    print(solution("aukks", "wbqd", 5))
}

fileprivate func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    let aUnicode = Int(UnicodeScalar("a").value)
    let zUnicode = Int(UnicodeScalar("z").value)
    
    var result = ""
    
    for char in s {
        let unicode = Int(UnicodeScalar(String(char))!.value)
        var i = 1
        var passedAlphabet = [String]()
        
        while passedAlphabet.count < index {
            let nextUnicode = (unicode + i - 97) % 26 + 97
            
            let nextChar = String(UnicodeScalar(nextUnicode)!)
            
            i += 1
            
            if skip.contains(where: { $0 == Character(nextChar) }) {
                continue
            }
            passedAlphabet.append(nextChar)
        }

        result += passedAlphabet.last!
    }
    
    return result
}
