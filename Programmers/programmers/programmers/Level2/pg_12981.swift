//
//  pg_12981.swift
//  programmers
//
//  Created by sejin on 2022/09/09.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/12981
// 영어 끝말잇기

import Foundation

func solve12981() {
    print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
}

fileprivate func solution(_ n:Int, _ words:[String]) -> [Int] {
    var res = [0, 0]
    var dict = [String: Int]()
    
    var prevWord = String(words[0].first!)
    
    for (i, word) in words.enumerated() {
        if word.first! != prevWord.last! || dict.keys.contains(word){
            res = [(i%n) + 1, (i/n)+1]
            break
        } else {
            prevWord = word
            dict[word] = 1
        }
    }
    
    return res
}
