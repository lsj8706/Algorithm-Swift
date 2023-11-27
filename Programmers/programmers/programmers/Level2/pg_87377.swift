//
//  pg_87377.swift
//  programmers
//
//  Created by sejin on 11/27/23.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/87377
//  교점에 별 만들기

import Foundation

func solve87377() {
//    print(solution([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]]))
//    print(solution(    [[0, 1, -1], [1, 0, -1], [1, 0, 1]]))
    print(solution([[1, -1, 0], [2, -1, 0]]))
}

fileprivate func solution(_ line:[[Int]]) -> [String] {
    var points = [(Int, Int)]()
    
    var leftX = Int.max
    var rightX = Int.min
    var topY = Int.min
    var bottomY = Int.max
    
    func getPointOfIntersection(line1: [Int], line2: [Int]) -> (Int, Int)? {
        let line1 = line1.map { Double($0) }
        let line2 = line2.map { Double($0) }
        let a = line1[0]
        let b = line1[1]
        let c = line1[2]
        let A = line2[0]
        let B = line2[1]
        let C = line2[2]
        
        if (-A*b + a*B) == 0 { return nil }
        
        let x: Double = (-B*c + C*b) / (-A*b + a*B)
        let y: Double = (c*A - a*C) / (-A*b + a*B)
        
        if let intX = Int(exactly: x), let intY = Int(exactly: y) {
            leftX = min(leftX, intX)
            rightX = max(rightX, intX)
            topY = max(topY, intY)
            bottomY = min(bottomY, intY)
            
            return (intX, intY)
        }
        
        return nil
    }
    
    for i in 0..<line.count-1 {
        for j in (i+1)..<line.count {
            if let point = getPointOfIntersection(line1: line[i], line2: line[j]) {
                points.append(point)
            }
        }
    }
    
    let xLen = rightX - leftX
    let yLen = topY - bottomY
    
    var board = Array(repeating: Array(repeating: ".", count: xLen+1), count: yLen+1)
    
    // 2차원 배열의 중심점을 (0,0) 좌표로 변환
    for point in points {
        let x = point.0 - leftX
        let y = topY - point.1
        
        board[y][x] = "*"
    }

    let result = board.map { $0.joined() }
    
    return result
}
