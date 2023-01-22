//
//  pg_133499.swift
//  programmers
//
//  Created by sejin on 2023/01/22.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/133499
// 옹알이 2

import Foundation

func solve133499() {
    print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
}

fileprivate func solution(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    
    var result = 0
    
    for babble in babbling {
        var babble = babble
        // 아기가 말할 수 있는 부분을 찾아서 제거 -> 반복문을 마치고 모드 remove 된다면 해당 단어는 아기가 발음할 수 있는 단어이다.
        for word in words {
            var shouldRepeat = true
            
            repeat {
                if let range = babble.range(of: word) {
                    
                    // 연속해서 같은 발음 하는 경우 검출
                    if babble.contains(String(repeating: word, count: 2)) {
                        break
                    }
                    
                    babble.replaceSubrange(range, with: "x")
                } else {
                    shouldRepeat = false
                }
            } while shouldRepeat
        }
        
        if Set(babble) == ["x"] {
            result += 1
        }
    }
    
    return result
}
