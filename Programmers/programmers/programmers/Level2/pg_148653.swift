//
//  pg_148653.swift
//  programmers
//
//  Created by sejin on 2023/06/17.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/148653
//  마법의 엘리베이터

import Foundation

func solve148653() {
    print(solution(95))
}

fileprivate func solution(_ storey: Int) -> Int {
    var result = 0
    var cur = storey
    
    while cur != 0 {
        let arrCur = Array(String(cur)).map { Int(String($0))! }
        let last = arrCur.last!
        
        // 마지막 자릿수가 5인경우, 5 미만인 경우, 5 초과인 경우를 구분
        if last == 5 {
            if arrCur.count >= 2 {
                // 마지막에서 두번째 자릿수가 5 미만 -> last인 5를 제거 하는 것이 유리
                // 마지막에서 두번째 자릿수가 5 초과 -> last에서 부족한 수를 더해줘서 10의 배수로 만드는 것이 유리
                let prev = arrCur[arrCur.count - 2]
                if prev < 5 {
                    result += last
                    cur = cur / 10
                } else {
                    result += 10 - last
                    cur = cur + 10 - last
                }
            } else {
                result += last
                cur = cur / 10
            }
        } else if last < 5 {
            result += last
            cur = cur / 10
        } else {
            result += 10 - last
            cur = cur + 10 - last
        }
    }
    
    return result
}
