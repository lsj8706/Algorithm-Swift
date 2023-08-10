//
//  pg_60061.swift
//  programmers
//
//  Created by sejin on 2023/08/10.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/60061
//  기둥과 보 설치

import Foundation

func solve60061() {
//    print(solution(5, [[1,0,0,1],[1,1,1,1],[2,1,0,1],[2,2,1,1],[5,0,0,1],[5,1,0,1],[4,2,1,1],[3,2,1,1]]))
    print(solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]]))
}

fileprivate func solution(_ n:Int, _ build_frame: [[Int]]) -> [[Int]] {
    //  map[x][y][a] (a가 0이면 기둥, 1이면 보)
    //  만약 map[2][2][0] = 0 이면 (2,2)위치에 기둥이 없다는 의미
    var map: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: n+1), count: n+1)
    
    for buildData in build_frame {
        let x = buildData[0]
        let y = buildData[1]
        let a = buildData[2]
        let isInstall = buildData[3] == 1

        if isInstall {
            // 설치
            if a == 0 {
                if checkPillar(map: map, x: x, y: y) {
                    map[y][x][0] = 1
                }
            } else {
                if checkBeam(map: map, x: x, y: y) {
                    map[y][x][1] = 1
                }
            }
        } else {
            // 삭제
            map[y][x][a] = 0
            if !checkEntireMap(n: n, map: map) {
                map[y][x][a] = 1
            }
        }
    }

    var result = [[Int]]()
    
    for y in 0...n {
        for x in 0...n {
            for a in 0...1 {
                if map[y][x][a] == 1 {
                    result.append([x, y, a])
                }
            }
        }
    }
    
    result = result.sorted(by: {
        if $0[0] == $1[0] {
            if $0[1] == $1[1] {
                return $0[2] < $1[2]
            }
            return $0[1] < $1[1]
        }
        return $0[0] < $1[0]
    })


    return result
}

fileprivate func checkPillar(map: [[[Int]]], x: Int, y: Int) -> Bool {
    if y == 0 || map[y-1][x][0] == 1 || map[y][x][1] == 1 || (x-1 >= 0 && map[y][x-1][1] == 1) {
        return true
    }
    
    return false
}

fileprivate func checkBeam(map: [[[Int]]], x: Int, y: Int) -> Bool {
    if map[y-1][x][0] == 1 || (x+1 < map.count && map[y-1][x+1][0] == 1) || (x-1 >= 0 && x < map.count && map[y][x-1][1] == 1 && map[y][x+1][1] == 1) {
        return true
    }
    
    return false
}

fileprivate func checkEntireMap(n: Int, map: [[[Int]]]) -> Bool {
    for y in 0...n {
        for x in 0...n {
            // 기둥일 때
            if map[y][x][0] == 1 && !checkPillar(map: map, x: x, y: y) {
                return false
            }
            
            // 보일 때
            if map[y][x][1] == 1 && !checkBeam(map: map, x: x, y: y) {
                return false
            }
        }
    }
    
    return true
}
