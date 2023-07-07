//
//  pg_12979.swift
//  programmers
//
//  Created by sejin on 2023/07/07.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/12979
//  기지국 설치

import Foundation

func solve12979() {
    print(solution(11, [4, 11], 1))
//    print(solution(16, [9], 2))
}

fileprivate func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    
    func calculateStationsCntRequired(apartmentsCnt: Int) {
        if apartmentsCnt <= 0 { return }
        let newStationsCnt = ceil(Double(apartmentsCnt) / Double(2*w+1))
        answer += Int(newStationsCnt)
    }

    for i in 0..<stations.count {
        let station = stations[i]
        // 이전 스테이션과 비교해서 커버 가능한지 판단
        let prevStation = i == 0 ? -w : stations[i-1]
        
        let prevStationCoverRight = prevStation + w
        let currentStationCoverLeft = station - w
        
        
        // 이전 스테이션의 우측 커버 범위와 현재 스테이션의 좌측 커버 범위가 떨어져 있을 때 => 즉, 새 스테이션을 추가해야 하는 상황
        if prevStationCoverRight + 1 < currentStationCoverLeft {
            let targetApartmentsCnt = currentStationCoverLeft - (prevStationCoverRight + 1)
            calculateStationsCntRequired(apartmentsCnt: targetApartmentsCnt)
        }
        
        // 마지막 스테이션의 우측 부분 검사
        if i == stations.count - 1 {
            let lastStationCoverRight = station + w
            let targetApartmentsCnt = n - lastStationCoverRight
            calculateStationsCntRequired(apartmentsCnt: targetApartmentsCnt)
        }
    }

    return answer
}
