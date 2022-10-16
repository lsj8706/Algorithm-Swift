//
//  Q_10.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/10/16.
//
// page 325
// 자물쇠와 열쇠

import Foundation

func solveQ_10() {
    print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]], [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))
}

fileprivate func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let m = key.count
    let n = lock.count
    var bigLock = Array(repeating: Array(repeating: 0, count: 2*m+n), count: 2*m+n)
    
    for i in 0..<n {
        for j in 0..<n {
            bigLock[i+m][j+m] = lock[i][j]
        }
    }
    
    for _ in 0..<4 {
        key = rotate(arr: key)
        
        for y in 1..<m+n {
            for x in 1..<m+n {
                let newLock = pushKey(lock: bigLock, key: key, x: x, y: y, m: m)
                if check(lock: newLock, m: m, n: n) {
                    return true
                }
            }
        }
    }
    
    return false
}

// 열쇠 회전
fileprivate func rotate(arr: [[Int]]) -> [[Int]] {
    var newArray = Array(repeating: Array(repeating: 0, count: arr.count), count: arr.count)
    
    for i in 0..<arr.count {
        for j in 0..<arr.count {
            newArray[j][arr.count - 1 - i] = arr[i][j]
        }
    }
    
    return newArray
}

// 열쇠 넣기
fileprivate func pushKey(lock: [[Int]], key: [[Int]], x: Int, y: Int, m: Int) -> [[Int]] {
    var newLock = lock
    for i in 0..<m {
        for j in 0..<m {
            newLock[i+y][j+x] += key[i][j]
        }
    }
    return newLock
}

// 열쇠가 자물쇠에 잘 맞는지 확인
fileprivate func check(lock: [[Int]], m: Int, n: Int) -> Bool {
    for i in 0..<n {
        for j in 0..<n {
            if lock[m+i][m+j] != 1 {
                return false
            }
        }
    }
    return true
}
