//
//  pg_161990.swift
//  programmers
//
//  Created by sejin on 2023/10/28.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/161990
//  바탕화면 정리

import Foundation

func solve161990() {
    print(solution([".#...", "..#..", "...#."]))
}

fileprivate func solution(_ wallpaper:[String]) -> [Int] {
    
    let wallpaper = wallpaper.map { Array($0) }
    
    var mostLeft = wallpaper[0].count
    var mostTop = wallpaper.count
    var mostRight = 0
    var mostBottom = 0
    
    for x in wallpaper.indices {
        for y in wallpaper[0].indices {
            if wallpaper[x][y] == "#" {
                mostLeft = min(mostLeft, y)
                mostTop = min(mostTop, x)
                mostRight = max(mostRight, y)
                mostBottom = max(mostBottom, x)
            }
        }
    }
        
    return [mostTop, mostLeft, mostBottom+1, mostRight+1]
}
