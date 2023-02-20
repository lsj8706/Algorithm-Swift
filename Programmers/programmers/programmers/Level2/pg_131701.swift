//
//  pg_131701.swift
//  programmers
//
//  Created by sejin on 2023/02/20.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/131701
// 연속 부분 수열 합의 개수

import Foundation

func solve131701() {
    print(solution([7,9,1,1,4]))
}

fileprivate func solution(_ elements:[Int]) -> Int {
    var numberSet = Set<Int>()
    
    // 부분 수열의 크기
    var size = 1

    while size <= elements.count {
        var sum = 0
        
        for i in 0..<size { // 초기값
            sum += elements[i % elements.count]
        }
        
        // 순차적으로 반복문을 돌며 이전에 구한 합을 이용해 새로운 합을 구한다.
        
        for j in 0..<elements.count {
            sum -= elements[j % elements.count] // 제일 앞에 있는 값을 빼고
            sum += elements[(j+size) % elements.count] // 제일 뒤에 있는 값을 더한다.
            numberSet.insert(sum)
        }
                
        size += 1
    }
    
    return numberSet.count
}

// 풀이에 참고한 링크 : https://school.programmers.co.kr/questions/40077
