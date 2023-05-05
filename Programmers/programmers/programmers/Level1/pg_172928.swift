//
//  pg_172928.swift
//  programmers
//
//  Created by sejin on 2023/05/05.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/172928
// 공원 산책

import Foundation

func solve172928() {
   print(solution(["OSO","OOO","OXO","OOO"], ["E 2","S 3","W 1"]))
}

fileprivate func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park = park.map { Array($0).map { String($0) } }
    let parkSize = (width: park[0].count, height: park.count)
    var current = (x: 0, y: 0)
    
    for i in park.indices {
        for j in park[0].indices {
            if park[i][j] == "S" {
                current = (j, i)
            }
        }
    }
            
    for route in routes {
        let route = route.split(separator: " ")
        let direction = String(route[0])
        let distance = Int(route[1])!
        
        var isValid = false
        var temp = current
        for i in 0..<distance {
            let nextPosition = move(origin: temp, direction: direction)
            let isInBoundary = checkBoundary(position: nextPosition, parkSize: parkSize)
            if !isInBoundary { break }
            
            let noObastacle = checkNoObstacle(park: park, position: nextPosition)
            
            if noObastacle {
                if i == distance - 1 {
                    isValid = true
                }
                temp = nextPosition
            } else {
                break
            }
        }
        
        if isValid {
            current = temp
        }
    }
    
    return [current.y, current.x]
}

fileprivate func move(origin: (x: Int, y: Int), direction: String) -> (x: Int, y: Int) {
    switch direction {
    case "N":
        return (origin.x, origin.y-1)
    case "S":
        return (origin.x, origin.y+1)
    case "W":
        return (origin.x-1, origin.y)
    case "E":
        return (origin.x+1, origin.y)
    default:
        print("방향 설정 오류")
        return origin
    }
}

fileprivate func checkBoundary(position: (x:Int, y: Int), parkSize: (width: Int, height: Int)) -> Bool {
    return 0..<parkSize.width ~= position.x && 0..<parkSize.height ~= position.y
}

fileprivate func checkNoObstacle(park: [[String]], position: (x: Int, y: Int)) -> Bool {
    return park[position.y][position.x] == "X" ? false : true
}
