//
//  pg_17676.swift
//  programmers
//
//  Created by sejin on 2023/09/29.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/17676
//  추석 트래픽

import Foundation

func solve17676() {
    print(solution([
        "2016-09-15 01:00:04.002 2.0s",
        "2016-09-15 01:00:07.000 2s"
        ]))
}

fileprivate func solution(_ lines:[String]) -> Int {
    let lines = lines.map { convertToMilliseconds(timeStr: $0) }
    var result = 0
    
    for line in lines {
        let start = line.start
        let end = line.end
        
        let sections: [Section] = [(start, start + 999), (end, end + 999)]
        
        for section in sections {
            let cnt = numOfTaskInSection(section: section, lines: lines)
            result = max(result, cnt)
        }
    }
    
    return result
}

fileprivate typealias Line = (start: Int, end: Int)
fileprivate typealias Section = (start: Int, end: Int)

fileprivate func numOfTaskInSection(section: Section, lines: [Line]) -> Int {
    var cnt = 0
    
    for line in lines {
        if line.start > section.end || line.end < section.start {
            continue
        }
        cnt += 1
    }
    
    return cnt
}

fileprivate func convertToMilliseconds(timeStr: String) -> Line {
    var timeStr = timeStr
    timeStr.removeLast()
    let components = timeStr.components(separatedBy: " ")
    let s = components[1]
    let t = Double(components[2])!
    
    let endTime = s.toMilliseconds
    let startTime = endTime - Int(t*1000) + 1
    
    return (startTime, endTime)
}

fileprivate extension String {
    var toMilliseconds: Int {
        let hourMinuteSecond = self.components(separatedBy: ":").map { Double($0)! * 1000 }.map { Int($0) }
        let hour = hourMinuteSecond[0]
        let minute = hourMinuteSecond[1]
        let seconds = hourMinuteSecond[2]
                
        return hour*60*60 + minute*60 + seconds
    }
}
