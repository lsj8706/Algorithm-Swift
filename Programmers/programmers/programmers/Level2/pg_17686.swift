//
//  pg_17686.swift
//  programmers
//
//  Created by sejin on 2022/08/29.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17686
// 파일명 정렬

import Foundation

func solve17686() {
    print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG", "foo010bar020.zip"]))
}

fileprivate func solution(_ files:[String]) -> [String] {
    
    let ans = files.sorted {
        var firstHead = ""
        var firstNumber = ""
        var firstTail = ""
        var secondHead = ""
        var secondNumber = ""
        var secondTail = ""
        
        $0.forEach { c in
            if (c.isLetter || c == "-" || c.isWhitespace) && firstNumber.isEmpty {
                firstHead.append(c.lowercased())
            } else if c.isNumber && firstTail.isEmpty {
                firstNumber.append(c)
            } else if c.isLetter || c.isNumber {
                firstTail.append(c.lowercased())
            }
        }
        
        $1.forEach { c in
            if (c.isLetter || c == "-" || c.isWhitespace) && secondNumber.isEmpty {
                secondHead.append(c.lowercased())
            } else if c.isNumber && secondTail.isEmpty {
                secondNumber.append(c)
            } else if c.isLetter || c.isNumber {
                secondTail.append(c.lowercased())
            }
        }
            
        if firstHead != secondHead {
            return firstHead < secondHead
        } else{
            if Int(firstNumber)! != Int(secondNumber)! {
                return Int(firstNumber)! < Int(secondNumber)!
            } else {
                let firstIndex = files.firstIndex(of: $0)!
                let secondIndex = files.firstIndex(of: $1)!
                return firstIndex < secondIndex
            }
        }
    }
    
    return ans
}
