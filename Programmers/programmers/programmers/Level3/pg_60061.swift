//
//  pg_60061.swift
//  programmers
//
//  Created by sejin on 2023/08/10.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/60061
//  기둥과 보 설치

import Foundation

func solve60061() {
//    print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
    print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))
}

fileprivate func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var result: [(x: Int, y: Int, isPillar: Bool)] = []
    
    for buildData in build_frame {
        let x = buildData[0]
        let y = buildData[1]
        let isPillar = buildData[2] == 0
        let isInstall = buildData[3] == 1
        
        if isInstall {
            // 설치
            result.append((x: x, y: y, isPillar: isPillar))
            if !isPossible(arr: result) {
                result.removeLast()
            }
        } else {
            // 삭제
            var temp = result
            temp.removeAll(where: { $0 == (x: x, y: y, isPillar: isPillar) })
            if isPossible(arr: temp) {
                result.removeAll(where: { $0 == (x: x, y: y, isPillar: isPillar) })
            }
        }
    }
    
    let answer = result
                    .map { [$0.x, $0.y, $0.isPillar ? 0 : 1] }
                    .sorted(by: {
                        if $0[0] == $1[0] {
                            if $0[1] == $1[1] {
                                return $0[2] < $1[2]
                            }
                            return $0[1] < $1[1]
                        }
                        
                        return $0[0] < $1[0]
                    })

    return answer
}

fileprivate func isPossible(arr: [(x: Int, y: Int, isPillar: Bool)]) -> Bool {
    for (x, y, isPillar) in arr {
        if isPillar { // 기둥일 때
            // 바닥에 설치 or 다른 기둥 위에 설치 or 보 위에 설치
            if y == 0
                || arr.contains(where: { $0 == (x, y-1, true) })
                || arr.contains(where: { $0 == (x-1, y, false) })
                || arr.contains(where: { $0 == (x, y, false) }) {
                continue
            }
            
            if arr.count == 6 {
                print(arr)
            }
            
            return false
        } else {    // 보일 때
            // 한쪽 끝이 기둥 위 or 양쪽 끝이 보랑 연결
            if arr.contains(where: { $0 == (x, y-1, true) })
                || arr.contains(where: { $0 == (x+1, y-1, true) })
                || (arr.contains(where: { $0 == (x-1, y, false) }) && arr.contains(where: { $0 == (x+1, y, false) })) {
                continue
            }
            
            return false
        }
    }
    
    return true
}
