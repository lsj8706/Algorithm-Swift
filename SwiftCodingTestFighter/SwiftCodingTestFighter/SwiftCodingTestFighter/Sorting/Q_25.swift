//
//  Q_25.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/19.
//
// Page 361
// 실패율
// https://school.programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

func solveQ_25() {
    print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
}

fileprivate func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var peopleInStage = Array(repeating: 0, count: N+2) // 각 스테이지에 머물러 있는 사람의 수, 모든 스테이지를 완료한 사람이 있기 때문에 N+2 만큼의 크기로 설정
    var numOfReach = Array(repeating: 0, count: N+3) // 각 스테이지를 완료한 사람의 수
    var failRate = Array(repeating: 0.0, count: N+2) // 각 스테이지별 실패율 기록

    for stage in stages{
        peopleInStage[stage] += 1
    }

    // 뒤부터 반복문을 돌아서 numOfReach를 갱신하는 것이 주요 아이디어
    for i in stride(from: N+1, through: 1, by: -1) {
        numOfReach[i] = numOfReach[i+1] + peopleInStage[i]
        failRate[i] = Double(peopleInStage[i]) / Double(numOfReach[i])
    }
    
    return failRate[1...N].enumerated().sorted(by: { $0.1 > $1.1 }).map{ $0.0 + 1 } // 어레이를 [1...N]으로 슬라이싱 했기 때문에 인덱스가 0부터 시작 => 1을 더해줘야 한다.
}

