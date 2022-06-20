//
//  main.swift
//  DFS_BFS
//
//  Created by User on 2022/06/21.
//
// https://www.acmicpc.net/problem/1914
// 하노이 탑

import Foundation

let input = Int(readLine()!)!

print(pow(2, input) - 1)

func hanoi(first: Int, second: Int, third: Int, count: Int) {
    if count == 1 {
        print(first, third)
        return
    }
    
    hanoi(first: first, second: third, third: second, count: count-1)
    print(first, third)
    hanoi(first: second, second: first, third: third, count: count-1)
}

if input <= 20 {
    hanoi(first: 1, second: 2, third: 3, count: input)
}
