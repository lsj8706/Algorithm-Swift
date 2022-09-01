//
//  pg_17683.swift
//  programmers
//
//  Created by sejin on 2022/09/01.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/17683
// 방금그곡

import Foundation

func solve17683() {
    print(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
}

fileprivate func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var res: (String, Int) = ("(None)", 0)
    
    var newM = [String]()
    let originM = Array(m)
    for note in originM {
        if note == "#" {
            newM[newM.count-1] = newM[newM.count-1].lowercased()
        } else {
            newM.append(String(note))
        }
    }
    
    let target = newM.joined(separator: " ")
    
    for musicinfo in musicinfos {
        let music = musicinfo.components(separatedBy: ",")
        let startTime = music[0].split(separator: ":").map({ Int($0)! })
        let endTime = music[1].split(separator: ":").map({ Int($0)! })
        let playTime = (endTime[0]*60 + endTime[1]) - (startTime[0]*60 + startTime[1])
        let name = music[2]
        let originNotes = Array(music[3])
        var notes = [String]()
        
        for note in originNotes {
            if note == "#" {
                notes[notes.count-1] = notes[notes.count-1].lowercased()
            } else {
                notes.append(String(note))
            }
        }

        var totalNotes = [String]()
        
        for i in 0..<playTime {
            let index = i % notes.count
            totalNotes.append(String(notes[index]))
        }
        
        if totalNotes.joined(separator: " ").contains(target) {
            if playTime > res.1 {
                res = (name, playTime)
            }
        }
    }
    
    return res.0
}
