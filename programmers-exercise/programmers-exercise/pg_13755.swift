//
//  pg_13755.swift
//  TOSS-NEXT-2022
//
//  Created by sejin on 2022/08/06.
//

import Foundation

func solve13755() {
    print(solution(["FORWARD", "FORWARD", "FORWARD", "UP", "FORWARD", "FORWARD", "DOWN", "BACK", "BACK", "UP", "UP", "FORWARD", "FORWARD", "UP", "FORWARD"]))
}


var x = 0
var y = 0
var upPoint = [0]

fileprivate func solution(_ commands: [String]) -> [Int] {
    for command in commands {
        switch command {
        case "FORWARD":
            forward()
        case "UP":
            up()
        case "BACK":
            back()
        case "DOWN":
            down()
        default:
            break
        }
    }
    
    return [x, y]
}

func forward() {
    x += 1
}

func up() {
    y += 1
    upPoint.append(x)
}

func back() {
    if x > 0 {
        if let lastUpPoint = upPoint.last {
            if x > lastUpPoint {
                x -= 1
            }
        }
    }
}

func down() {
    if y == 0 {
        return
    }
    
    if let lastUpPoint = upPoint.popLast() {
        let gap = x - lastUpPoint
        x -= gap
        y -= 1
    }
}
