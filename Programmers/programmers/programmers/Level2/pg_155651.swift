//
//  pg_155651.swift
//  programmers
//
//  Created by sejin on 2023/06/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/155651
//  호텔 대실

import Foundation

func solve155651() {
    print(solution([["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]]))
}

fileprivate func solution(_ book_time:[[String]]) -> Int {
    
    // 하루를 분 단위로 어레이로 만든다.
    var timeTable = Array(repeating: 0, count: 24*60+10)
    // 해당 시각(분)에 필요한 방의 개수를 어레이로 만든다.
    var roomCnt = Array(repeating: 0, count: 24*60+10)
    
    for bookTime in book_time {
        let startTime = bookTime[0].toMinutes
        let endTime = bookTime[1].toMinutes + 10 // 청소시간 10분 더하기
        
        // 누적합을 이용할 것이기 때문에 시작 시간에 +1, 나가는 시간에 -1만 해준다.
        timeTable[startTime] += 1
        timeTable[endTime] -= 1
    }

    // 누적합을 이용해 roomCnt를 채워 나간다.
    roomCnt[0] = timeTable[0]
    for i in 1..<timeTable.count {
        roomCnt[i] = roomCnt[i-1] + timeTable[i]
    }
    
    // 하루 중 가장 많은 방이 필요한 시각의 방의 개수를 리턴한다.
    return roomCnt.max()!
}

fileprivate extension String {
    var toMinutes: Int {
        let time = self.split(separator: ":").map({ Int($0)! })
        let minutes = time[0]*60 + time[1]
        return minutes
    }
}

// 누적합, imos 사용 (https://driip.me/65d9b58c-bf02-44bf-8fba-54d394ed21e0)
