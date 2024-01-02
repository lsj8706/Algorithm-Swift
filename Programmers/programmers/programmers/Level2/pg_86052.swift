//
//  pg_86052.swift
//  programmers
//
//  Created by sejin on 1/2/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/86052
//  빛의 경로 사이클

import Foundation

func solve86052() {
//    print(solution(["SL","LR"]))
    print(solution(["R", "R"]))
}

fileprivate func solution(_ grid:[String]) -> [Int] {
    let grid = grid.map { Array($0).map { String($0) } }
    var results = [Int]()
    var routes = Set<[Int]>() // [x1,y1,x2,y2,direction]
    
    func getNextPosition(x: Int, y: Int, from direction: Direction, node: String) -> (Int, Int, Direction) {
        var nextX = x
        var nextY = y
        var dir = direction
        
        func increaseX() {
            nextX = x+1
            nextY = y
            if nextX >= grid.count {
                nextX = 0
            }
            dir = .fromTop
        }
        
        func decreaseX() {
            nextX = x-1
            nextY = y
            if nextX < 0 {
                nextX = grid.count-1
            }
            dir = .fromBottom
        }
        
        func increaseY() {
            nextX = x
            nextY = y+1
            if nextY >= grid[0].count {
                nextY = 0
            }
            dir = .fromLeft
        }
        
        func decreaseY() {
            nextX = x
            nextY = y-1
            if nextY < 0 {
                nextY = grid[0].count-1
            }
            dir = .fromRight
        }
        
        switch node {
        case "S":
            switch direction {
            case .fromTop:
                increaseX()
            case .fromLeft:
                increaseY()
            case .fromRight:
                decreaseY()
            case .fromBottom:
                decreaseX()
            }
        case "L":
            switch direction {
            case .fromTop:
                increaseY()
            case .fromLeft:
                decreaseX()
            case .fromRight:
                increaseX()
            case .fromBottom:
                decreaseY()
            }
        case "R":
            switch direction {
            case .fromTop:
                decreaseY()
            case .fromLeft:
                increaseX()
            case .fromRight:
                decreaseX()
            case .fromBottom:
                increaseY()
            }
        default:
            break
        }
        
        return (nextX, nextY, dir)
    }
    
    func findRoute(x: Int, y: Int, from: Direction, count: Int, now: Set<[Int]>) {
        var now = now
        let node = grid[x][y]
        let (nextX, nextY, direction) = getNextPosition(x: x, y: y, from: from, node: node)
        
        let edge = [x, y, nextX, nextY, from.rawValue]
        // 이미 계산한 경로인 경우 return
        if routes.contains(edge) {
            return
        }
        
        // 하나의 경로를 다 탐색한 경우
        if now.contains(edge) {
            results.append(count)
            routes = routes.union(now)
            return
        }
        
        now.insert(edge)
        findRoute(x: nextX, y: nextY, from: direction, count: count+1, now: now)
    }
    
    for x in grid.indices {
        for y in grid[0].indices {
            for direction in Direction.allCases {
                findRoute(x: x, y: y, from: direction, count: 0, now: [])
            }
        }
    }
        
    return results.sorted()
}

fileprivate enum Direction: Int, CaseIterable {
    case fromTop = 0
    case fromLeft = 1
    case fromRight = 2
    case fromBottom = 3
}
