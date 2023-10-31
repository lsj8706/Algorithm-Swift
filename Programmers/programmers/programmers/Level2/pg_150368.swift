//
//  pg_150368.swift
//  programmers
//
//  Created by sejin on 2023/10/31.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/150368
//  이모티콘 할인행사

import Foundation

func solve150368() {
    print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
}

fileprivate func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var result = [0, 0]
    
    let discountRates = permutationWithRepetition(arr: [10, 20, 30, 40], count: emoticons.count)
    
    for discountRate in discountRates {
        let newPrice = zip(emoticons, discountRate).map { (price, discount) in
            return price * (100-discount)/100
        }

        var tempEmoticonPlusUser = 0
        var tempTotalSales = 0
        
        outer: for user in users {
            let discountRateCriticalPoint = user[0]
            let emoticonPlusCriticalPoint = user[1]
            var sum = 0
            
            for i in discountRate.indices {
                if discountRate[i] >= discountRateCriticalPoint {
                    sum += newPrice[i]
                }
                
                if sum >= emoticonPlusCriticalPoint {
                    tempEmoticonPlusUser += 1
                    continue outer
                }
            }
            tempTotalSales += sum
        }
        
        if result[0] < tempEmoticonPlusUser {
            result = [tempEmoticonPlusUser, tempTotalSales]
        } else if result[0] == tempEmoticonPlusUser {
            if result[1] < tempTotalSales {
                result = [tempEmoticonPlusUser, tempTotalSales]
            }
        }
    }
    
    return result
}

// 중복 순열
fileprivate func permutationWithRepetition(arr: [Int], count: Int) -> [[Int]] {
    var result = [[Int]]()
    
    func dfs(now: [Int]) {
        if now.count == count {
            result.append(now)
            return
        }
        
        for num in arr {
            dfs(now: now + [num])
        }
    }
    
    dfs(now: [])
    
    return result
}
