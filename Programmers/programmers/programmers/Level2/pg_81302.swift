//
//  pg_81302.swift
//  programmers
//
//  Created by sejin on 2023/06/13.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/81302
//  거리두기 확인하기

import Foundation

func solve81302() {
    print(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
}

fileprivate func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    for place in places {
        let isDistancing = isDistancingWorking(place: place) ? 1 : 0
        result.append(isDistancing)
    }
    
    return result
}

fileprivate func isDistancingWorking(place: [String]) -> Bool {
    
    let place = place.map { Array($0).map { String($0) } }
    
    var personPositions = [(Int, Int)]()
    
    for i in 0...4 {
        for j in 0...4 {
            if place[i][j] == "P" {
                personPositions.append((i, j))
            }
        }
    }
    
    for i in 0..<personPositions.count {
        for j in i+1..<personPositions.count {
            let x1 = personPositions[i].0
            let y1 = personPositions[i].1
            let x2 = personPositions[j].0
            let y2 = personPositions[j].1

            let distance = manhattanDistance(x1: x1, y1: y1, x2: x2, y2: y2)
            
            if distance == 1 {
                return false
            } else if distance == 2 {
                // 직선 거리가 2일 때
                if x1 == x2 || y1 == y2 {
                    let middleX = (x1+x2)/2
                    let middleY = (y1+y2)/2
                    
                    if place[middleX][middleY] != "X" {
                        return false
                    }
                } else {
                // 대각선일 때
                    let x3 = x1
                    let y3 = y2
                    let x4 = x2
                    let y4 = y1
                    
                    if place[x3][y3] != "X" || place[x4][y4] != "X" {
                        return false
                    }
                }
            }
        }
    }
    
    return true
}

fileprivate func manhattanDistance(x1: Int, y1: Int, x2: Int, y2: Int) -> Int {
    return abs(x1-x2) + abs(y1-y2)
}
