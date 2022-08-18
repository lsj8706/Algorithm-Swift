//
//  pg_67256.swift
//  programmers-exercise
//
//  Created by sejin on 2022/08/15.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/67256
// 키패드 누르기

import Foundation

func solve67256() {
    print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
}

fileprivate func solution(_ numbers:[Int], _ hand:String) -> String {
    var res = ""
    var leftPosition = [3, 0]
    var rightPosition = [3, 2]
        
    for number in numbers {
        switch number {
        case 1,4,7:
            leftPosition = findPosition(number)
            res.append("L")
        case 3,6,9:
            rightPosition = findPosition(number)
            res.append("R")
        case 2,5,8,0:
            let destPostion = findPosition(number)
            let leftDistance = getDistance(destPostion, leftPosition)
            let rightDistance = getDistance(destPostion, rightPosition)
            
            if leftDistance > rightDistance {
                rightPosition = destPostion
                res.append("R")
            } else if rightDistance > leftDistance {
                leftPosition = destPostion
                res.append("L")
            } else {
                if hand == "right" {
                    rightPosition = destPostion
                    res.append("R")
                } else {
                    leftPosition = destPostion
                    res.append("L")
                }
            }
        default:
            break
        }
    }
    
    return res
}


fileprivate func findPosition(_ num: Int) -> [Int] {
    let keyboard = [[1,2,3], [4,5,6], [7,8,9], [-1,0,-2]]
    
    for i in 0..<keyboard.count {
        for j in 0..<keyboard[i].count {
            if keyboard[i][j] == num {
                return [i, j]
            }
        }
    }
    
    return [0, 0]
}

fileprivate func getDistance(_ arr1: [Int], _ arr2: [Int]) -> Int {
    return abs(arr1[0]-arr2[0]) + abs(arr1[1]-arr2[1])
}
