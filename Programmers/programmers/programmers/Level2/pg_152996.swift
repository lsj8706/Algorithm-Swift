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
    print(solution([100, 100, 100, 150, 150, 200, 300]))
}

fileprivate func solution(_ weights:[Int]) -> Int64 {
    var result: Int64 = 0
    
    var newWeights = [Int]()
    var weightDict = [Int: Int64]()
    
    // 가능한 몸무게의 종류는 901개 밖에 안되기 때문에 중복을 제거하면 시간 복잡도가 대폭 낮아진다.
    // 대신 제거한 중복 개수를 고려하여 나중에 시소 짝꿍 계산에 있어서 결과값에 더해주어야 한다.
    weights.forEach {
        if let duplicateCnt = weightDict[$0] {
            weightDict[$0] = duplicateCnt + 1
        } else {
            weightDict[$0] = 1
            newWeights.append($0)
        }
    }
    
    newWeights.sort()
    
    for i in newWeights.indices {
        var pairCnt: Int64 = 0

        for j in newWeights.indices {
            if i == j { continue }
            
            let light = newWeights[i]
            let heavy = newWeights[j]
            
            if checkIsPair(light: light, heavy: heavy) {
                let heavyDuplicatCnt = weightDict[heavy]!
                pairCnt += heavyDuplicatCnt
            }
        }
        
        let duplicateCnt = weightDict[newWeights[i]]!
        result += duplicateCnt * pairCnt + (duplicateCnt*(duplicateCnt-1)/2)
        // 예를 들어 100kg가 4명이었고 100kg과 짝꿍인 몸무게가 3쌍이었다면 4*3을 해줘서 중복 제거했던 것을 다시 복구해준다.
        // 그리고 중복 제거한 같은 몸무게끼리도 시소 짝꿍이기 때문에 조합 계산을 해서 4C2를 더해준다.
    }
    
    return result
}


fileprivate func checkIsPair(light: Int, heavy: Int) -> Bool {
    let distanceCombi = [[3,2], [4,3], [4,2]]
    
    for distance in distanceCombi {
        let leftTorque = light * distance[0]
        let rightTorque = heavy * distance[1]
        
        if leftTorque == rightTorque {
            return true
        }
    }
    
    return false
}
