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
    print(solution(    [[0, 1, -1], [1, 0, -1], [1, 0, 1]]))
}

fileprivate func solution(_ line:[[Int]]) -> [String] {
    var points = [(Int, Int)]()
    
    for i in 0..<line.count-1 {
        for j in (i+1)..<line.count {
            if let point = getPointOfIntersection(line1: line[i], line2: line[j]) {
                points.append(point)
            }
        }
    }
    
    var maxX = 0
    var maxY = 0
    
    for point in points {
        let absX = abs(point.0)
        let absY = abs(point.1)
        
        maxX = max(maxX, absX)
        maxY = max(maxY, absY)
    }
        
    var board = Array(repeating: Array(repeating: ".", count: 2*maxX+1), count: 2*maxY+1)
    
    for point in points {
        let x = point.0 + maxX
        let y = abs(point.1 - maxY)
        
        board[y][x] = "*"
    }

    let result = board.map { $0.joined() }
    
    return result
}

fileprivate func getPointOfIntersection(line1: [Int], line2: [Int]) -> (Int, Int)? {
    let line1 = line1.map { Double($0) }
    let line2 = line2.map { Double($0) }
    let a = line1[0]
    let b = line1[1]
    let c = line1[2]
    let A = line2[0]
    let B = line2[1]
    let C = line2[2]
    
    var x: Double = 0
    var y: Double = 0
    
    if -B*c + C*b != 0 {
        x = (-B*c + C*b) / (-A*b + a*B)
    }
    
    if -a*x - c != 0 {
        y = (-a*x - c) / b
    }
    
    if let intX = Int(exactly: x), let intY = Int(exactly: y) {
        return (intX, intY)
    }
    
    return nil
}
