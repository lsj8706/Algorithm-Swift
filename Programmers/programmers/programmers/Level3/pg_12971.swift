//
//  pg_12971.swift
//  programmers
//
//  Created by sejin on 2023/07/13.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/12971
//  스티커 모으기(2)

import Foundation

func solve12971() {
    print(solution([14, 6, 5, 11, 3, 9, 2, 10]))
}

fileprivate func solution(_ sticker:[Int]) -> Int{
    var answer = 0
    
    var ch = Array(repeating: false, count: sticker.count)

    func dfs(i: Int, sum: Int) {
        if i == sticker.count {
            answer = max(answer, sum)
            return
        }
        
        if ch[i] == false {
            let temp = ch
            ch[i] = true
            var left = i-1
            var right = (i + 1) % ch.count
            
            // 좌측
            if i == 0 {
                left = ch.count - 1
                ch[left] = true
            } else {
                ch[left] = true
            }
            
            // 우측
            ch[right] = true
            
            dfs(i: i+1, sum: sum + sticker[i])
            
            // 뜯어낸 부분 복구
            ch[i] = false
            if temp[left] == false {
                ch[left] = false
            }
            
            if temp[right] == false {
                ch[right] = false
            }
        }
        
        // 현재 스티커를 뜯지 않고 넘어가는 경우의 수
        dfs(i: i+1, sum: sum)
    }

    dfs(i: 0, sum: 0)
    
    return answer
}
