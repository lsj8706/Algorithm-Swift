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
    print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
    print(solution(0, 0, [[0,0,2,1,2],[4,5,3,1,2],[4,11,4,0,2],[10,4,0,4,2]] ))
}

fileprivate func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var problems = problems
    var goalAlp = alp
    var goalCop = cop
    
    for problem in problems {
        goalAlp = max(goalAlp, problem[0])
        goalCop = max(goalCop, problem[1])
    }
    
    // 문제를 풀지 않고 공부를 해서 시간당 1의 알고력/코딩력을 키우는 경우를 추가해준다.
    problems.append([0,0,1,0,1])
    problems.append([0,0,0,1,1])
    
    // dp[a][b] = 알고력 a, 코딩력 b를 갖추기 위해 사용한 최소 시간
    var dp = Array(repeating: Array(repeating: Int.max, count: goalCop+1), count: goalAlp+1)
    dp[alp][cop] = 0
    
    for a in alp...goalAlp {
        for b in cop...goalCop {
            if a == goalAlp && b == goalCop {
                return dp[a][b]
            }

            // 현재 알고력(a)와 코딩력(b)를 투입해서 풀 수 있는 문제들을 풀었을 때의 dp 배열을 갱신
            solveProblem(a: a, b: b, dp: &dp, problems: problems, goalAlp: goalAlp, goalCop: goalCop)
        }
    }
        
    return dp[goalAlp][goalCop]
}

fileprivate func solveProblem(a: Int, b: Int, dp: inout [[Int]], problems: [[Int]], goalAlp: Int, goalCop: Int) {
    for problem in problems {
        let alp_req = problem[0]
        let cop_req = problem[1]
        let alp_rwd = problem[2]
        let cop_rwd = problem[3]
        let cost = problem[4]
        
        // 해당 문제를 풀지 못하는 경우는 continue
        if a < alp_req { continue }
        if b < cop_req { continue }
        
        let nextA = min(a+alp_rwd, goalAlp)
        let nextB = min(b+cop_rwd, goalCop)
        
        dp[nextA][nextB] = min(dp[nextA][nextB], dp[a][b] + cost)
    }
}
