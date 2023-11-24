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
    var result = 0
    
    var boxCap = 0
    var emptyBoxCap = 0
    
    for i in stride(from: n-1, through: 0, by: -1) {
        if deliveries[i] != 0 || pickups[i] != 0 {
            var cnt = 0
            
            // 해당 위치의 집에 배송, 수거 전부 완료하기
            while boxCap < deliveries[i] || emptyBoxCap < pickups[i] {
                cnt += 1
                boxCap += cap
                emptyBoxCap += cap
            }
            
            result += (i+1) * (cnt*2)
            
            boxCap -= deliveries[i]
            emptyBoxCap -= pickups[i]
        }
    }
    
    return Int64(result)
}
