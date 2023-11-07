//
//  pg_118668.swift
//  programmers
//
//  Created by sejin on 2023/11/07.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/118668
//  코딩 테스트 공부

import Foundation

func solve118668() {
//    print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
    print(solution(0, 0, [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]]    ))
}

fileprivate func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    let goalAlp = problems.sorted(by: { $0[0] > $1[0] }).first![0]
    let goalCop = problems.sorted(by: { $0[1] > $1[1] }).first![1]
    
    // dp[a][b] = 알고력 a, 코딩력 b를 갖추기 위해 사용한 최소 시간
    var dp = Array(repeating: Array(repeating: 150, count: 500), count: 500)
    dp[alp][cop] = 0
    
    for a in alp..<dp.count {
        for b in cop..<dp.count {
            if a == alp && b == cop { continue }
            
            // 문제를 안 풀고 공부를 통해 시간당 1의 알고력/코딩력을 높이는 경우
            if a-1 >= 0 {
                dp[a][b] = min(dp[a-1][b] + 1, dp[a][b])
            }
            
            if b-1 >= 0 {
                dp[a][b] = min(dp[a][b-1] + 1, dp[a][b])
            }
            
            // 문제를 풀어서 알고력/코딩력을 높이는 경우
            solveProblem(a: a, b: b, dp: &dp, problems: problems)
        }
    }
    
    var result = dp[goalAlp][goalCop]
    
    for a in goalAlp..<dp.count {
        for b in goalCop..<dp.count {
            result = min(result, dp[a][b])
        }
    }
    
    return result
}

fileprivate func solveProblem(a: Int, b: Int, dp: inout [[Int]], problems: [[Int]]) {
    for problem in problems {
        let alp_req = problem[0]
        let cop_req = problem[1]
        let alp_rwd = problem[2]
        let cop_rwd = problem[3]
        let cost = problem[4]
        
        // 해당 문제를 풀지 못하는 경우는 continue
        if a - alp_rwd < alp_req { continue }
        if b - cop_rwd < cop_req { continue }
        
        dp[a][b] = min(dp[a][b], dp[a - alp_rwd][b - cop_rwd] + cost)
    }
}
