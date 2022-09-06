//
//  pg_87390.swift
//  programmers
//
//  Created by sejin on 2022/09/06.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/87390
// n^2 배열 자르기


import Foundation

func solve87390() {
    print(solution(4, 7, 14))
}

fileprivate func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    var res = [Int]()
    
    for i in Int(left)...Int(right) {
        let y = i / n
        let x = i % n
        
        let value = max(y, x) + 1
        res.append(value)
    }
    
    return res
}

// 전체 어레이에 값을 채워 넣으면 시간 초과 발생
// left와 right 사이의 값들만 구해야 한다.
// 좌표 (a, b)에 들어갈 숫자는 max(a, b) + 1 이라는 규칙 존재
// a와 b를 구하는 방법은 다음과 같다. (num은 left...right 범위의 임의의 숫자)
// a = num / n
// b = num % n
// 이유는 직접 2차원 배열을 그려서 확인해 보면 쉽게 알 수 있다.
// 위의 공식들을 이용하면 시간 복잡도를 대폭 낮출 수 있다.
