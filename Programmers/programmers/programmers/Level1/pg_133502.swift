//
//  pg_133502.swift
//  programmers
//
//  Created by sejin on 2023/01/26.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/133502
// 햄버거 만들기

import Foundation

func solve133502() {
    print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))
}

private func solution(_ ingredient:[Int]) -> Int {
    let ingredient = ingredient
    var result = 0
    var index = 0

    let burgerSample: [Int] = [1, 2, 3, 1]
    var burgerTemp: [Int] = []
    
    while index < ingredient.count {
        let num = ingredient[index]
        
        burgerTemp.append(num)
        
        let slice = Array(burgerTemp.suffix(4))
        
        if slice == burgerSample {
            burgerTemp.removeLast(4)
            result += 1
        }
        
        index += 1
    }
    
    return result
}
