//
//  review_43162.swift
//  programmers
//
//  Created by sejin on 2/23/24.
//

import Foundation

func review43162() {
  print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
}

fileprivate func solution(_ n:Int, _ computers:[[Int]]) -> Int {
  var result = 0
  
  var visited = Array(repeating: false, count: n)
  
  func bfs(node: Int) {
    var q = [Int]()
    q.append(node)
    
    while !q.isEmpty {
      let first = q.removeFirst()
      
      let adjacentNodes = getAdjacentNodes(of: first, computers: computers)
      
      for adjacentNode in adjacentNodes {
        if visited[adjacentNode] == false {
          visited[adjacentNode] = true
          q.append(adjacentNode)
        }
      }
    }
    
  }
  
  for node in 0..<n {
    if visited[node] == false {
      visited[node] = true
      result += 1
      bfs(node: node)
    }
  }
  
  return result
}

fileprivate func getAdjacentNodes(of node: Int, computers: [[Int]]) -> [Int] {
  var adjacentNodes = [Int]()
  
  for i in 0..<computers[0].count {
    if i != node && computers[node][i] == 1 {
      adjacentNodes.append(i)
    }
  }
  
  return adjacentNodes
}
