//
//  pg_60063.swift
//  programmers
//
//  Created by sejin on 2023/08/30.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/60063
//  블록 이동하기

import Foundation

func solve60063() {
    print(solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]))
}

fileprivate func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    var distance = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    
    var queue = [RobotCoordinate]()
    queue.append(RobotCoordinate(wing1: (0,0), wing2: (0,1)))
    distance[0][0] = 0
    distance[0][1] = 0
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()

        let movablePositions = findMovablePositions(board: board, cur: cur)
        let curDistance = max(distance[cur.wing1.x][cur.wing1.y], distance[cur.wing2.x][cur.wing2.y])
        
        if cur.wing1 == (n-1, n-1) || cur.wing2 == (n-1, n-1) {
            distance[n-1][n-1] = curDistance
            break
        }
        
        for position in movablePositions {
            if curDistance+1 <= distance[position.wing1.x][position.wing1.y] || curDistance+1 <= distance[position.wing2.x][position.wing2.y] {
                queue.append(position)
                
                distance[position.wing1.x][position.wing1.y] = min(distance[position.wing1.x][position.wing1.y], curDistance + 1)
                distance[position.wing2.x][position.wing2.y] = min(distance[position.wing2.x][position.wing2.y], curDistance + 1)
            }
        }
    }

    return distance[n-1][n-1]
}

fileprivate func findMovablePositions(board: [[Int]], cur: RobotCoordinate) -> [RobotCoordinate] {
    
    func canMove(coord: Coordinate) -> Bool {
        return board[coord.x][coord.y] == 0
    }
    
    let n = board.count
    
    var movablePositions = [RobotCoordinate]()
    
    let curLeft = cur.leftPosition      // 로봇의 왼쪽 날개
    let curRight = cur.rightPosition    // 로봇의 오른쪽 날개
    let curTop = cur.topPosition        // 로봇의 위쪽 날개
    let curBottom = cur.bottomPosition  // 로봇의 아래쪽 날개
    
    // 좌
    if curLeft.y >= 1 && canMove(coord: (curLeft.x, curLeft.y-1))
        && canMove(coord: (curRight.x, curRight.y-1)) {
        movablePositions.append(RobotCoordinate(wing1: (curLeft.x, curLeft.y-1),
                                                wing2: (curRight.x, curRight.y-1)))
    }
    
    // 우
    if curRight.y < n-1 && canMove(coord: (curLeft.x, curLeft.y+1))
        && canMove(coord: (curRight.x, curRight.y+1)) {
        movablePositions.append(RobotCoordinate(wing1: (curLeft.x, curLeft.y+1),
                                                wing2: (curRight.x, curRight.y+1)))
    }
    
    // 상
    if curTop.x >= 1 && canMove(coord: (curTop.x-1, curTop.y))
        && canMove(coord: (cur.bottomPosition.x-1, curBottom.y)) {
        movablePositions.append(RobotCoordinate(wing1: (curTop.x-1, curTop.y),
                                                wing2: (curBottom.x-1, curBottom.y)))
    }
    
    // 하
    if curBottom.x < n-1 && canMove(coord: (curBottom.x+1, curBottom.y))
        && canMove(coord: (curTop.x+1, curTop.y)) {
        movablePositions.append(RobotCoordinate(wing1: (curBottom.x+1, cur.bottomPosition.y),
                                                wing2: (curTop.x+1, curTop.y)))
    }
    
    if cur.isHorizontal {
        // 왼쪽 날개를 회전축으로
        // 시계 방향
        if curLeft.x < n-1 && canMove(coord: (curRight.x+1, curRight.y)) && canMove(coord: (curLeft.x+1, curLeft.y)) {
            movablePositions.append(RobotCoordinate(wing1: curLeft, wing2: (curLeft.x+1, curLeft.y)))
        }
        
        // 반시계 방향
        if curLeft.x >= 1 && canMove(coord: (curRight.x-1, curRight.y)) && canMove(coord: (curLeft.x-1, curLeft.y)) {
            movablePositions.append(RobotCoordinate(wing1: curLeft, wing2: (curLeft.x-1, curLeft.y)))
        }
        
        // 오른쪽 날개를 회전축으로
        // 시계 방향
        if curRight.x >= 1 && canMove(coord: (curLeft.x-1, curLeft.y)) && canMove(coord: (curRight.x-1, curRight.y)) {
            movablePositions.append(RobotCoordinate(wing1: (curRight.x-1, curRight.y), wing2: curRight))
        }
        
        // 반시계 방향
        if curRight.x < n-1 && canMove(coord: (curLeft.x+1, curLeft.y)) && canMove(coord: (curRight.x+1, curRight.y)) {
            movablePositions.append(RobotCoordinate(wing1: (curRight.x+1, curRight.y), wing2: curRight))
        }
    } else {    // 수직인 상태
        // 위쪽 날개를 회전축으로
        // 시계 방향
        if curTop.y >= 1 && canMove(coord: (curBottom.x, curBottom.y-1)) && canMove(coord: (curTop.x, curTop.y-1)) {
            movablePositions.append(RobotCoordinate(wing1: curTop, wing2: (curTop.x, curTop.y-1)))
        }
        
        // 반시계 방향
        if curTop.y < n-1 && canMove(coord: (curBottom.x, curBottom.y+1)) && canMove(coord: (curTop.x, curTop.y+1)) {
            movablePositions.append(RobotCoordinate(wing1: curTop, wing2: (curTop.x, curTop.y+1)))
        }
        
        // 아래쪽 날개를 회전축으로
        // 시계 방향
        if curBottom.y < n-1 && canMove(coord: (curTop.x, curTop.y+1)) && canMove(coord: (curBottom.x, curBottom.y+1)) {
            movablePositions.append(RobotCoordinate(wing1: (curBottom.x, curBottom.y+1), wing2: curBottom))
        }
        
        // 반시계 방향
        if curBottom.y >= 1 && canMove(coord: (curTop.x, curTop.y-1)) && canMove(coord: (curBottom.x, curBottom.y-1)) {
            movablePositions.append(RobotCoordinate(wing1: (curBottom.x, curBottom.y-1), wing2: curBottom))
        }
    }
    
    return movablePositions
}


fileprivate typealias Coordinate = (x: Int, y: Int)

fileprivate struct RobotCoordinate {
    var wing1: Coordinate
    var wing2: Coordinate
    
    var leftPosition: Coordinate {
        return wing1.y <= wing2.y ? wing1 : wing2
    }
    
    var rightPosition: Coordinate {
        return wing1.y <= wing2.y ? wing2 : wing1
    }
    
    var topPosition: Coordinate {
        return wing1.x <= wing2.x ? wing1 : wing2
    }
    
    var bottomPosition: Coordinate {
        return wing1.x <= wing2.x ? wing2 : wing1
    }
    
    var isHorizontal: Bool {
        return wing1.x == wing2.x
    }
}
