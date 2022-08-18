//
//  pg_13752.swift
//  TOSS-NEXT-2022
//
//  Created by sejin on 2022/08/06.
//
// 토스 NEXT 2022
// 말풍선 꾸미기

import Foundation

func solve13752() {
    print(solution([["2022-06-24T23:57:42", "정원", "민탁님"], ["2022-06-24T23:57:44", "정원", "생일이 얼마 안남으셨네요"], ["2022-06-24T23:57:54", "정원", "소감 한말씀 부탁드립니닼ㅋㅋㅋ"], ["2022-06-24T23:58:02", "금상", "오~ 민탁님 내일 생일이세요? 축하해요!"], ["2022-06-24T23:58:05", "민탁", "으악 감사해요 이렇게 늦은저녁까지 챙겨주시고ㅠㅠ!"], ["2022-06-24T23:58:34", "도현", "민탁님 축하드려요~~!"], ["2022-06-24T23:58:36", "도현", ""], ["2022-06-24T23:58:55", "금상", "민탁님"], ["2022-06-24T23:59:01", "금상", "생일기념 내일 뭐하시나요~"], ["2022-06-24T23:59:10", "정원", "가족과 여행?"], ["2022-06-24T23:59:12", "금상", "해외여행 가시는건가요!!"], ["2022-06-24T23:59:55", "민탁", "일주일쉬면서 가족하고 하와이갑니다~~ 축하감사해요 모두!"], ["2022-06-25T00:00:01", "정원", "이제 진짜 생일되셨네요!! 축하합니다!!"], ["2022-06-25T00:01:05", "민탁", ""]]))
}

fileprivate func solution(_ messages:[[String]]) -> [String] {
    if messages.isEmpty {
        return []
    }
    
    var ans = [String]()
    var person = ""
    var prevMessage = messages[0]
    
    for message in messages {
        // 다른 사람
        if person != message[1] {
            person = message[1]
            appendTimeStamp(arr: &ans, timeString: prevMessage[0])
            checkDayAndAppend(arr: &ans, prevDay: prevMessage[0].day, timeString: message[0])
            appendPerson(arr: &ans, name: message[1])
            appendMessage(arr: &ans, message: message[2])
        } else {
            // 같은 사람
            if prevMessage[0].timeStamp != message[0].timeStamp {
                appendTimeStamp(arr: &ans, timeString: prevMessage[0])
                checkDayAndAppend(arr: &ans, prevDay: prevMessage[0].day, timeString: message[0])
                appendPerson(arr: &ans, name: message[1])
            } else {
                checkDayAndAppend(arr: &ans, prevDay: prevMessage[0].day, timeString: message[0])
            }
            appendMessage(arr: &ans, message: message[2])
        }
        prevMessage = message
    }
    
    let _ = ans.removeFirst()
    appendTimeStamp(arr: &ans, timeString: prevMessage[0])
    return ans
}


func appendTimeStamp(arr: inout [String], timeString: String) {
    arr.append(timeString.timeStamp)
}

func appendPerson(arr: inout [String], name: String) {
    arr.append("[\(name)]")
}

func appendMessage(arr: inout [String], message: String) {
    message == "" ? arr.append("<삭제된 메시지>") : arr.append(message)
}

func checkDayAndAppend(arr: inout [String], prevDay: String, timeString: String) {
    if prevDay != timeString.day {
        arr.append(timeString.dayMessage)
    }
}


extension String {
    var dayMessage: String {
        return "-- \(self.prefix(10)) --"
    }
    
    var day: String {
        let arr = self.components(separatedBy: "T")
        return String(arr[0].suffix(2))
    }
    
    var hour: String {
        let arr = self.components(separatedBy: ":")
        return String(arr[0].suffix(2))
    }
    
    var minute: String {
        let arr = self.components(separatedBy: ":")
        return arr[1]
    }
                
    var timeStamp: String {
        return "(\(self.hour):\(self.minute))"
    }
}
