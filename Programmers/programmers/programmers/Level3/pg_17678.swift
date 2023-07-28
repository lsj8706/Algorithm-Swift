//
//  pg_17678.swift
//  programmers
//
//  Created by sejin on 2023/07/28.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/17678
//  [1차] 셔틀버스

import Foundation

func solve17678() {
    print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))
//    print(solution(2, 10, 2, ["09:10", "09:09", "08:00"]))
}

// 마지막 셔틀에 타도록 도착 시간을 정하면 됨
// 마지막 셔틀 시간을 찾자
// 시간들을 오름차순으로 정렬
// 마지막 셔틀을 탈 수 있도록 끼어드는 시간을 찾자

fileprivate func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let startTime = "09:00".minutes
    let lastSuttleTime = startTime + (n-1)*t
    var timetable = timetable.map { $0.minutes }.sorted().filter { $0 <= lastSuttleTime }
    var result: Int = 0
    
    for i in 0..<n {
        // 마지막 셔틀 전
        if i < n-1 {
            let shuttleTime = startTime + i*t
            var cnt = 0 // 탑승 인원 수
            while cnt < m && !timetable.isEmpty {
                let crewTime = timetable.first!
                if crewTime <= shuttleTime {
                    timetable.removeFirst()
                    cnt += 1
                } else {
                    break
                }
            }
        }
        
        // 마지막 셔틀
        if i == n-1 {
            // 셔틀의 마지막 자리에 타도록 하면 됨
            // 1. 자리가 널널하다면 셔틀의 도착시간에 줄 서도록
            // 2. 자리가 부족하다면 마지막 사람보다 1분 더 일찍 오도록
            if timetable.count < m {
                result = lastSuttleTime
                break
            }
            
            if timetable[m-1] > lastSuttleTime {
                result = lastSuttleTime
            } else {
                result = timetable[m-1] - 1
            }
        }
    }
    
    return result.toTimeString
}

fileprivate extension String {
    var minutes: Int {
        let times = self.split(separator: ":")
        let hours = Int(times[0])! * 60
        let minutes = Int(times[1])!
        return hours + minutes
    }
}

fileprivate extension Int {
    var toTimeString: String {
        let hours = self / 60
        let minutes = self % 60
        var time = ""
        hours < 10 ? time.append("0\(hours)") : time.append("\(hours)")
        time.append(":")
        minutes < 10 ? time.append("0\(minutes)") : time.append("\(minutes)")
        return time
    }
}
