//
//  pg_64061.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/15.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/64061
// 크레인 인형뽑기 게임

import Foundation

func solve64061() {
    print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
}

fileprivate func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    let basket = Basket()

    for move in moves {
        for i in 0..<board.count {
            if board[i][move-1] != 0 {
                basket.push(board[i][move-1])
                board[i][move-1] = 0
                break
            }
        }
    }
        
    return basket.deletedCnt
}

class Basket {
    var basket = [Int]()
    var deletedCnt = 0
    
    func push(_ num: Int) {
        if basket.isEmpty {
            basket.append(num)
            return
        }
        
        if basket[basket.count-1] == num {
            print(num)
            _ = basket.popLast()
            deletedCnt += 2
        } else {
            basket.append(num)
        }
    }
}
