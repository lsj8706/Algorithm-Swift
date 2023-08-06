//
//  pg_92344.swift
//  programmers
//
//  Created by sejin on 2023/08/06.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/92344
//  파괴되지 않은 건물

import Foundation

func solve92344() {
    print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]], [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]]))
}

fileprivate func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var board = board
    let n = board.count
    let m = board[0].count
    var degrees = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)
    
    for _skill in skill {
        handleSkill(degrees: &degrees, skill: _skill)
    }
    
    // 가로 누적합
    for x in 0..<n+1 {
        var sum = 0
        for y in 0..<m+1 {
            sum += degrees[x][y]
            degrees[x][y] = sum
        }
    }
    
    // 세로 누적합
    for y in 0..<m+1 {
        var sum = 0
        for x in 0..<n+1 {
            sum += degrees[x][y]
            degrees[x][y] = sum
        }
    }
    
    // board에 누적합 적용
    for x in 0..<n {
        for y in 0..<m {
            board[x][y] += degrees[x][y]
        }
    }
 
    return board.flatMap { $0 }.filter { $0 > 0 }.count
}

fileprivate func handleSkill(degrees: inout [[Int]], skill: [Int]) {
    let skill = Skill(skill)
    let degree = skill.degree
    let startX = skill.startPoint.x
    let startY = skill.startPoint.y
    let endX = skill.endPoint.x
    let endY = skill.endPoint.y
    
    degrees[startX][startY] += degree
    degrees[startX][endY+1] += degree * -1
    degrees[endX+1][startY] += degree * -1
    degrees[endX+1][endY+1] += degree
}

fileprivate enum SkillType: Int {
    case attack = 1
    case heal = 2
}

fileprivate struct Skill {
    let skillType: SkillType
    let startPoint: (x: Int, y: Int)
    let endPoint: (x: Int, y: Int)
    let _degree: Int
    var degree: Int {
        return skillType == .attack ? _degree * -1 : _degree
    }
    
    init(_ skill: [Int]) {
        self.skillType = SkillType(rawValue: skill[0])!
        self.startPoint = (skill[1], skill[2])
        self.endPoint = (skill[3], skill[4])
        self._degree = skill[5]
    }
}
