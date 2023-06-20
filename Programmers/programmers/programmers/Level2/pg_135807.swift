//
//  pg_135807.swift
//  programmers
//
//  Created by sejin on 2023/06/20.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/135807
//  숫자 카드 나누기

import Foundation

func solve135807() {
    print(solution([10, 20], [5]))
}

fileprivate func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var result = 0
    let arrayA = arrayA.sorted()
    let arrayB = arrayB.sorted()
    
    // 각 어레이의 최솟값의 약수들
    var aSubMultiples = Set<Int>()
    var bSubMultiples = Set<Int>()

    for i in 1...arrayA[0] {
        if arrayA[0] % i == 0 {
            aSubMultiples.insert(i)
        }
    }
    
    for i in 1...arrayB[0] {
        if arrayB[0] % i == 0 {
            bSubMultiples.insert(i)
        }
    }
    
    // 약수가 중복되면 해당 약수로는 정답이 될 수 없기 때문에 차집합으로 빼준다.
    aSubMultiples = aSubMultiples.subtracting(bSubMultiples)
    bSubMultiples = bSubMultiples.subtracting(aSubMultiples)

    outer: for i in aSubMultiples.sorted(by: >) {
        
        for a in arrayA {
            if a % i != 0 {
                continue outer
            }
        }
        
        for b in arrayB {
            if b % i == 0 {
                continue outer
            }
        }
        
        result = max(result, i)
        break
    }
    
    outer: for i in bSubMultiples.sorted(by: >) {
        
        if i <= result { break }
        
        for b in arrayB {
            if b % i != 0 {
                continue outer
            }
        }
        
        for a in arrayA {
            if a % i == 0 {
                continue outer
            }
        }
        
        result = max(result, i)
    }
    
    return result
}
