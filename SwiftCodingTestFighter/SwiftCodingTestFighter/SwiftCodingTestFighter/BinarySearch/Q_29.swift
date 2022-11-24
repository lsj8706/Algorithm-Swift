//
//  Q_29.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/24.
//
// page 369
// 공유기 설치

import Foundation

func solveQ_29() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, c) = (input[0], input[1])
    var houses = [Int]()
    
    for _ in 0..<n {
        let house = Int(readLine()!)!
        houses.append(house)
    }
    
    houses.sort(by: <) // 오름차순 정렬
    
    // 이분 탐색의 대상은 공유기를 설치한 집 사이의 최소 거리이다.
    var start = 1
    var end = houses[n-1]-houses[0]
    var res = 0
    
    while start <= end {
        let mid = (start + end) / 2
        
        var cnt = 1 // 첫 번째 집에 공유기 설치
        var lastHouse = houses[0] // 직전에 공유기를 설치한 집
        
        // 해당 mid 만큼의 간격을 두면 최대 몇개의 공유기를 설치 할 수 있는지 확인
        for house in houses {
            if (house - lastHouse) >= mid {
                cnt += 1
                lastHouse = house
            }
        }
        
        // c 이상으로 설치 가능 => 간격을 더 늘릴 수 있다.
        if cnt >= c {
            res = max(res, mid)
            start = mid + 1
        } else {
            // c 미만으로 설치 가능 => 간격을 더 좁혀야 더 많은 집에 공유기 설치 가능
            end = mid - 1
        }
    }
 
    print(res)
}
