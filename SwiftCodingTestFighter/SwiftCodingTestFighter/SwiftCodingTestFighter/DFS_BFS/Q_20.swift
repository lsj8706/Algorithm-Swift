//
//  Q_20.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/13.
//
// page 351
// 감시 피하기
// https://www.acmicpc.net/problem/18428

import Foundation

func solveQ_20() {
    let N = Int(readLine()!)!
    var map = [[String]]()
    var studentLoc = [(x: Int, y: Int)]()
    var teacherLoc = [(x: Int, y: Int)]()
    var blankLoc = [(x: Int, y: Int)]()
    
    for _ in 0..<N {
        let arr = readLine()!.split(separator: " ").map { String($0) }
        map.append(arr)
    }
    
    // 선생님, 학생, 빈칸의 위치를 각각의 어레이에 넣는다.
    for y in 0..<N {
        for x in 0..<N {
            if map[y][x] == "T" {
                teacherLoc.append((x: x, y: y))
            } else if map[y][x] == "S" {
                studentLoc.append((x: x, y: y))
            } else {
                blankLoc.append((x: x, y: y))
            }
        }
    }
    
    // 조합을 통해 빈칸 위치 리스트에서 3개의 좌표를 선택한 모든 경우의 수를 구한다.
    let combiResults = combination(blankLoc, 3)
    
    for combiResult in combiResults {
        var newMap = map
        newMap[combiResult[0].y][combiResult[0].x] = "O"
        newMap[combiResult[1].y][combiResult[1].x] = "O"
        newMap[combiResult[2].y][combiResult[2].x] = "O"
        
        // 학생을 찾을 수 있으면 true
        var res = [Bool]()
        
        // 각 선생님의 위치에서 학생들을 찾을 수 있는지 확인
        for teacher in teacherLoc {
            let canFind = canFindStudent(x: teacher.x, y: teacher.y, map: newMap)
            res.append(canFind)
        }
        
        // 모든 선생님이 학생을 찾지 못했다면 "YES"를 출력하고 함수 종료
        if res.allSatisfy({ $0 == false }) {
            print("YES")
            return
        }
    }
    
    print("NO")
}

// 선생님의 위치에서 학생을 찾을 수 있는지 확인하는 함수, 찾을 수 있으면 true 리턴
func canFindStudent(x: Int, y: Int, map: [[String]]) -> Bool {
    var newX = x
    var newY = y
    // 왼쪽
    while newX > 0 {
        newX -= 1
        if map[y][newX] == "O" { break }
        if map[y][newX] == "S" { return true }
    }
    // 다시 초기화
    newX = x
    
    // 오른쪽
    while newX < map.count - 1 {
        newX += 1
        if map[y][newX] == "O" { break }
        if map[y][newX] == "S" { return true }
    }
    
    // 위쪽
    while newY > 0 {
        newY -= 1
        if map[newY][x] == "O" { break }
        if map[newY][x] == "S" { return true }
    }
    newY = y
    
    // 아래쪽
    while newY < map.count - 1 {
        newY += 1
        if map[newY][x] == "O" { break }
        if map[newY][x] == "S" { return true }
    }
    
    return false
}

// 조합
func combination<T>(_ elements: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    
    func combi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        for i in index..<elements.count {
            combi(i + 1, now + [elements[i]])
        }
    }
    combi(0, [])
    return result
}
