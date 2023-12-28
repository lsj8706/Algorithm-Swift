//
//  pg_148652.swift
//  programmers
//
//  Created by sejin on 12/28/23.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/148652
//  유사 칸토어 비트열

import Foundation

func solve148652() {
    print(solution(2, 4, 17))
}

// https://school.programmers.co.kr/questions/44982 참고
// https://school.programmers.co.kr/questions/41641 같은 로직인데 재귀로 푼 경우

fileprivate func solution(_ n:Int, _ l:Int64, _ r:Int64) -> Int {

    let oneCountSumAtSmallBlock: [Int64] = [1,2,2,3,4] // "11011"에서 1의 개수 누적합
    
    func getOneCountUntil(k: Int64) -> Int64 {
        var beforeKSum: Int64 = 0
        var tempN = n
        var remainder = k
    
        while tempN > 0 {
            let blockSize = getBlockSize(n: tempN)
            if tempN == 1 {
                if remainder >= 1 {
                    beforeKSum += oneCountSumAtSmallBlock[Int(remainder)-1]
                }
                break
            }
            
            let quotient = remainder / blockSize
            remainder = remainder % blockSize
            
            beforeKSum += getOneCount(n: tempN) * quotient
            
            // 가운데 0연속으로 나오는 부분 카운트에서 제거
            if quotient >= 3 {
                beforeKSum -= getOneCount(n: tempN)
            }
            
            tempN -= 1
            
            if remainder == 0 || quotient == 2 { // quotient가 2이면 나머지가 몇이든 0만 있는 블록이기 때문에 break를 한다.
                break
            }
        }
        
        return beforeKSum
    }
    
    return Int(getOneCountUntil(k: r) - getOneCountUntil(k: l-1))
}

fileprivate func getBlockSize(n: Int) -> Int64 {
    return pow(5, n-1)
}

fileprivate func getOneCount(n: Int) -> Int64 {
    return pow(4, n-1)
}

fileprivate func pow(_ a: Int, _ b: Int) -> Int64 {
    let a = Double(a)
    let b = Double(b)
    return Int64(pow(a, b))
}
