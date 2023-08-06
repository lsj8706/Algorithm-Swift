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
    var degrees = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
    
    for _skill in skill {
        handleSkill(degrees: &degrees, skill: _skill)
    }
    
    for x in 0..<degrees.count {
        var prefixSum = 0
        for y in 0..<degrees[0].count {
            prefixSum += degrees[x][y]
            board[x][y] += prefixSum
        }
    }
 
    return board.flatMap { $0 }.filter { $0 > 0 }.count
}

fileprivate func handleSkill(degrees: inout [[Int]], skill: [Int]) {
    let skill = Skill(skill)
    
    for x in skill.xRange {
        let left = skill.startPoint.y
        let right = skill.endPoint.y
        degrees[x][left] += skill.effect()
        
        if right + 1 < degrees[0].count {
            degrees[x][right+1] -= skill.effect()
        }
    }
}

fileprivate enum SkillType: Int {
    case attack = 1
    case heal = 2
}

fileprivate struct Skill {
    let skillType: SkillType
    let startPoint: (x: Int, y: Int)
    let endPoint: (x: Int, y: Int)
    let degree: Int
    
    var xRange: ClosedRange<Int> {
        self.startPoint.x...self.endPoint.x
    }
    
    var yRange: ClosedRange<Int> {
        self.startPoint.y...self.endPoint.y
    }
    
    init(_ skill: [Int]) {
        self.skillType = SkillType(rawValue: skill[0])!
        self.startPoint = (skill[1], skill[2])
        self.endPoint = (skill[3], skill[4])
        self.degree = skill[5]
    }
    
    func effect() -> Int {
        return skillType == .attack ? degree * -1 : degree
    }
}
