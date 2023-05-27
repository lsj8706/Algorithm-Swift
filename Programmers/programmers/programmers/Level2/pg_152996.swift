//
//  pg_152996.swift
//  programmers
//
//  Created by sejin on 2023/05/27.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/152996
//  시소 짝꿍

import Foundation

func solve152996() {
    print(solution([100,180,360,100,270]))
}

fileprivate func solution(_ weights:[Int]) -> Int64 {
    var result: Int64 = 0
    
    let peopleCombi = combination(weights, 2)
        
    var pairDict = [PeoplePair: Bool]()
    
    for people in peopleCombi {
        if let didPair = pairDict[people] {
            if didPair {
                result += 1
            }
        } else {
            let isPair = people.checkIsPair()
            if isPair {
                result += 1
            }
            pairDict[people] = isPair
        }
    }
    
    return result
}

fileprivate struct PeoplePair: Hashable {
    let first: Int
    let second: Int
    
    init(arr: [Int]) {
        self.first = arr[0]
        self.second = arr[1]
    }
    
    func checkIsPair() -> Bool {
        let distanceCombi = [[3,2], [4,3], [4,2]]
        
        // 몸무게가 같은 경우 무조건 시소 짝꿍 가능
        if first == second {
            return true
        }
        
        for distance in distanceCombi {
            let leftTorque = first*distance[0]
            let rightTorque = second*distance[1]
            
            if leftTorque == rightTorque {
                return true
            }
        }
        
        return false
    }
}


fileprivate func combination(_ array: [Int], _ n: Int) -> [PeoplePair] {
    var result = [PeoplePair]()
    if array.count < n { return result }
    
    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        // print(stack)
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(PeoplePair(arr: elements.sorted()))
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
    }
    
    return result
}
