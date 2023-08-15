//
//  pg_72414.swift
//  programmers
//
//  Created by sejin on 2023/08/15.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/72414
//  광고 삽입

import Foundation

func solve72414() {
//    print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]))
    print(solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"]))
//    print(solution("50:00:00", "50:00:00", ["15:36:51-38:21:49", "10:14:18-15:36:51", "38:21:49-42:51:45"]))
}

// 1. 누적합
// 2. 누적합 배열에서의 크기 고정의 subArr의 쵀댓값
fileprivate func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let totalSeconds = play_time.toSeconds

    var prefixSum = Array(repeating: 0, count: totalSeconds+2)    // 시청자 수 누적합 기록
    
    for log in logs {
        let logArr = log.components(separatedBy: "-")
        let startTime = logArr[0].toSeconds
        let endTime = logArr[1].toSeconds
        
        prefixSum[startTime] += 1
        prefixSum[endTime] -= 1
    }
    
    var viewerCntByTime = Array(repeating: 0, count: totalSeconds+2) // 영상의 재생 시간에서의 시청자 수
    
    var sum = 0
    for i in viewerCntByTime.indices {
        sum += prefixSum[i]
        viewerCntByTime[i+1] = sum
    }
    
    let adTotalSeconds = adv_time.toSeconds
    var adStartTime = 0
    var adEndTime = adTotalSeconds-1
    var result = adStartTime
    
    var currentAdViewerShip = viewerCntByTime[0...adTotalSeconds].reduce(0, +)
    var maxAdViewerShip = currentAdViewerShip  // 광고 시청자 수의 최댓값
    
    while adEndTime < totalSeconds {
        currentAdViewerShip = currentAdViewerShip - viewerCntByTime[adStartTime] + viewerCntByTime[adEndTime+1]
        
        adStartTime += 1
        adEndTime += 1
        
        if currentAdViewerShip > maxAdViewerShip {
            maxAdViewerShip = currentAdViewerShip
            result = adStartTime
        }
    }
    
    return result.toHHMMSS
}

fileprivate extension String {
    var toSeconds: Int {
        let hourMinuteSecond = self.split(separator: ":")
        let hours = Int(hourMinuteSecond[0])!
        let minutes = Int(hourMinuteSecond[1])!
        let seconds = Int(hourMinuteSecond[2])!
        
        return hours*60*60 + minutes*60 + seconds
    }
}

fileprivate extension Int {
    var toHHMMSS: String {
        let hours = self/(60*60)
        let minutes = self%(60*60)/60
        let seconds = self%60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
