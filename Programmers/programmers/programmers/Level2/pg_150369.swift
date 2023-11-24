//
//  pg_150369.swift
//  programmers
//
//  Created by sejin on 2023/11/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/150369
//  택배 배달과 수거하기

import Foundation

func solve150369() {
//    print(solution(4, 5, [1, 0, 3, 1, 2], [0, 3, 0, 4, 0]))
//    print(solution(1, 5, [0, 0, 1, 0, 0],  [0, 0, 0, 0, 0]))
    print(solution(2, 2, [0,0], [0, 4]))
}

fileprivate func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries = deliveries
    var pickups = pickups
    
    var distance = 0
    
    while !deliveries.isEmpty && !pickups.isEmpty {
        var destination = 0

        // 뒤부터 deliveries 제거
        var lastIndex = deliveries.count - 1
        var box = cap
        var emptyBox = 0
        var index = lastIndex
    
        while (box > 0 || emptyBox < cap) && index >= 0 {
            if deliveries[index] > 0 || pickups[index] > 0 {
                destination = max(destination, index + 1)
            }
            
            if box > 0 {
                box -= deliveries[index]
                deliveries[index] = 0
                if box < 0 {
                    deliveries[index] = abs(box)
                }
            }
            
            if emptyBox < cap {
                emptyBox += pickups[index]
                pickups[index] = 0
                if emptyBox > cap {
                   pickups[index] = emptyBox - cap
                }
            }
            
            lastIndex = deliveries.count - 1
            
            if deliveries[lastIndex] == 0 && pickups[lastIndex] == 0 {
                deliveries.removeLast()
                pickups.removeLast()
            }
            
            index -= 1
        }
        
        distance += destination * 2
    }
    
    return Int64(distance)
}
