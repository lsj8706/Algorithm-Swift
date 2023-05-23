//
//  pg_60058.swift
//  programmers
//
//  Created by sejin on 2023/05/23.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/60058
//  괄호 변환

import Foundation

func solve60058() {
  print(solution("(()())()"  ))
}

fileprivate func solution(_ p:String) -> String {

  func makeValidBracketString(w: String) -> String {
    // 1~3단계 작업
    if w.isEmpty { return "" }

    var u = ""
    var v = ""
    
    var openBracketCnt = 0
    var needToAppendToU = true
    
    for bracket in w {
      if bracket == "(" {
        openBracketCnt += 1
      } else {
        openBracketCnt -= 1
      }
      
      needToAppendToU ? u.append(bracket) : v.append(bracket)
      
      if openBracketCnt == 0 {
        needToAppendToU = false
      }
    }
    
    if checkIsValidBracketString(with: u) {
      return u + makeValidBracketString(w: v)
    } else {
      // 4단계 작업
      var temp = "("
      temp.append(makeValidBracketString(w: v))
      temp.append(")")
      
      u.removeFirst()
      u.removeLast()
      
      u = flipBracket(str: u)
      temp.append(u)
      
      return temp
    }
  }
  
  return makeValidBracketString(w: p)
}

// 올바른 괄호 분자열인지 판단
fileprivate func checkIsValidBracketString(with str: String) -> Bool {
  if str.isEmpty { return true }
  if str.first! == ")" { return false }
  let arr = str.map { String($0) }
  var stack = [String]()
  
  for bracket in arr {
    if bracket == "(" {
      stack.append(bracket)
    } else {
      if !stack.isEmpty {
        _ = stack.popLast()
      } else {
        return false
      }
    }
  }
  
  return stack.isEmpty ? true : false
}

// 괄호 뒤집기
fileprivate func flipBracket(str: String) -> String {
  var result = ""
  for bracket in str {
    bracket == "(" ? result.append(")") : result.append("(")
  }
  
  return result
}
