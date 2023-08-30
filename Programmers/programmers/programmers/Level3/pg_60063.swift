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
//    print(solution([[0, 0, 1, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 1, 0, 0, 0, 0], [1, 0, 0, 0, 1, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0, 0, 0, 0, 0], [0, 1, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 1, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]))
//    print(solution([[0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0]]))
}

fileprivate func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    var visited = Set<String>()
    
    var queue = [RobotCoordinate]()
    queue.append(RobotCoordinate(wing1: (0,0), wing2: (0,1), cost: 0))
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()

        let movablePositions = findMovablePositions(board: board, cur: cur)
        
        if cur.wing1 == (n-1, n-1) || cur.wing2 == (n-1, n-1) {
            return cur.cost
        }
        
        for _position in movablePositions {
            var position = _position
            if !visited.contains(position.toString) {
                position.cost = cur.cost + 1
                queue.append(position)
                visited.insert(position.toString)
            }
        }
    }

    return -1
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
        && canMove(coord: (curBottom.x-1, curBottom.y)) {
        movablePositions.append(RobotCoordinate(wing1: (curTop.x-1, curTop.y),
                                                wing2: (curBottom.x-1, curBottom.y)))
    }
    
    // 하
    if curBottom.x < n-1 && canMove(coord: (curBottom.x+1, curBottom.y))
        && canMove(coord: (curTop.x+1, curTop.y)) {
        movablePositions.append(RobotCoordinate(wing1: (curBottom.x+1, curBottom.y),
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
    var cost = 0
    
    var leftPosition: Coordinate {
        [wing1, wing2].sorted { $0.y < $1.y }[0]
    }
    
    var rightPosition: Coordinate {
        [wing1, wing2].sorted { $0.y < $1.y }[1]
    }
    
    var topPosition: Coordinate {
        [wing1, wing2].sorted { $0.x < $1.x }[0]
    }
    
    var bottomPosition: Coordinate {
        [wing1, wing2].sorted { $0.x < $1.x }[1]
    }
    
    var isHorizontal: Bool {
        return wing1.x == wing2.x
    }
    
    var toString: String {
        return "\(leftPosition.x),\(leftPosition.y),\(rightPosition.x),\(rightPosition.y)"
    }
}
