//
//  pg_154538.swift
//  programmers
//
//  Created by sejin on 2023/05/08.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/154538
//  숫자 변환하기

import Foundation

func solve154538() {
  print(solution(10, 40, 30))
}

fileprivate func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    let result = -1
    
    var q = DoubleStackQueue<[Int]>()
    q.enqueue([y, 0])
    
    while !q.isEmpty {
        let first = q.dequeue()!
        let (now, cnt) = (first[0], first[1])
        
        if now == x {
            return cnt
        }
        
        if now > x {
            if now % 3 == 0 {
                q.enqueue([now/3, cnt+1])
            }
            if now % 2 == 0 {
                q.enqueue([now/2, cnt+1])
            }
            q.enqueue([now-n, cnt+1])
        }
    }
    
    return result
}

/*
 x부터 검사하는 것이 아니라 y부터 하향식으로 검사해야 시간 초과를 막을 수 있다.
 왜냐하면 x부터 +n , *2, *3 의 3가지 경우의 수를 모두 체크하면 오래 걸리지만
 y부터 3과 2로 각각 나누어 떨어질 때만 해당 경우의 수를 검사하면 연산의 수가 줄어들게 되기 때문이다.
 
 dfs를 사용하면 시간 초과가 나와서 bfs로 해결했다.
*/
