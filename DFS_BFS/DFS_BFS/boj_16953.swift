//
//  main.swift
//  DFS_BFS
//
//  Created by User on 2022/06/21.
//
// https://www.acmicpc.net/problem/16953
// A -> B

import Foundation

let input = readLine()!.split(separator: " ").map({ Int($0)! })
var a = input[0]
let b = input[1]

var cnt = 0
var found = false

func DFS(cnt: Int, num: Int) {
    if num > b { return }
    else if num == b {
        found = true
        print(cnt)
    }
    else {
        DFS(cnt: cnt+1, num: num*2)
        DFS(cnt: cnt+1, num: Int("\(String(num))1")!)
    }
}

DFS(cnt: 1, num: a)
if !found {
    print(-1)
}
