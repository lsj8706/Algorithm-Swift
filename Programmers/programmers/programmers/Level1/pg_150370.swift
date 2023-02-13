//
//  pg_150370.swift
//  programmers
//
//  Created by sejin on 2023/02/13.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/150370
// 개인정보 수집 유효기간

import Foundation

func solve150370() {
    print(solution("2021.12.08", ["A 18"], ["2020.06.08 A"]))
}

fileprivate func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    var result = [Int]()
    var termsDict = [String: Int]()
    
    // 약관별 유효기간을 딕셔너리에 저장
    for term in terms {
        let termData = term.split(separator: " ")
        let termName = String(termData[0])
        let termPeriod = Int(termData[1])!
        termsDict[termName] = termPeriod
    }
    
    // 약관들을 반복문을 통해 돌면서 파기되었는지 확인
    for (index, privacy) in privacies.enumerated() {
        let privacyData = privacy.split(separator: " ")
        let registerDate = String(privacyData[0])
        let termsName = String(privacyData[1])
        let termsPeriod = termsDict[termsName]!
        
        let isExpired = checkIsExpired(today: today, registerDate: registerDate, period: termsPeriod)
        
        if isExpired {
            result.append(index + 1)
        }
    }
    
    return result
}

fileprivate func checkIsExpired(today: String, registerDate: String, period: Int) -> Bool {
    let today = parseDateString(date: today)
    let registerDate = parseDateString(date: registerDate)
    
    var expirationYear = registerDate[0]
    var expirationMonth = registerDate[1] + period  // 가입 월에 유효기간을 더함
    var expirationDay = registerDate[2] - 1
    
    // 유효기간을 더했을 때 12월 초과라면 나머지 연산으로 초과된 만큼의 년도를 더하고 Month 수정
    if expirationMonth > 12 {
        expirationYear += (expirationMonth / 12)
        expirationMonth = expirationMonth % 12
    }
    
    // 만약 가입 일이 1일이어서 1을 뺐을 때 0이 되었다면 이전달 마지막 날로 설정 (28일 고정)
    if expirationDay == 0 {
        expirationDay = 28
        expirationMonth -= 1
    }
    
    // 파기 월이 0이 되면 이전 달인 12월로 수정하고 년도 수정
    if expirationMonth == 0 {
        expirationMonth = 12
        expirationYear -= 1
    }
    
    let expirationDate = [expirationYear, expirationMonth, expirationDay]
    
    // 오늘 날짜와 파기 날짜 비교
    for i in 0...2 {
        if today[i] > expirationDate[i] {
            return true
        } else if today[i] == expirationDate[i] {
            continue
        } else {
            return false
        }
    }
    
    return false
}

fileprivate func parseDateString(date: String) -> [Int] {
    return date.split(separator: ".").map { Int(String($0))! }
}
