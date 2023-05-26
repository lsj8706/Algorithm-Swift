 //
//  pg_67257.swift
//  programmers
//
//  Created by sejin on 2023/05/26.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/67257
//  [카카오 인턴] 수식 최대화

import Foundation

func solve67257() {
    print(solution("100-200*300-500+20"))
}

fileprivate func solution(_ expression:String) -> Int64 {
    let expression = separateNumbersAndOperators(from: expression)
    
    let priorities = permutation(["*", "+", "-"], 3)

    var result: Int64 = 0

    for priority in priorities {
        var temp = expression
        for op in priority {
            // op는 연산자, 반복문을 돌며 우선순위가 높은 연산자부터 계산
            var tempExpression = [String]() // 연산자를 한 종류씩 계산하고 남은 계산식
            var leftOperand: Int = -1 // 좌측 피연산자, -1일 경우 연산하지 않아야 함
            for x in temp {
                if x == op {
                    leftOperand = Int(tempExpression.popLast()!)!
                } else {
                    if leftOperand == -1 {
                        tempExpression.append(x)
                    } else {
                        let rightOperand = Int(x)!
                        let calcResult = calculate(op: op, leftOperand: leftOperand, rightOperand: rightOperand)
                        leftOperand = -1
                        tempExpression.append(contentsOf: calcResult)
                    }
                }
            }
            temp = tempExpression
        }
        
        let now: Int64 = abs(Int64(temp.first!)!)
        result = max(result, now)
    }
    
    return result
}

fileprivate func calculate(op: String, leftOperand: Int, rightOperand: Int) -> [String] {
    var calcResult = 0
    
    switch op {
    case "+":
        calcResult = leftOperand+rightOperand
    case "-":
        calcResult = leftOperand-rightOperand
    case "*":
        calcResult = leftOperand*rightOperand
    default:
        print("의도하지 않은 연산자")
    }
    return [String(calcResult)]
}

// 숫자와 연산자 분리
fileprivate func separateNumbersAndOperators(from input: String) -> [String] {
    var result: [String] = []
    var currentNumber = ""
    
    for character in input {
        if let _ = Int(String(character)) {
            currentNumber.append(character)
        } else {
            if !currentNumber.isEmpty {
                result.append(currentNumber)
                currentNumber = ""
            }
            result.append(String(character))
        }
    }
    
    if !currentNumber.isEmpty {
        result.append(currentNumber)
    }
    
    return result
}

// 순열
fileprivate func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    
    var stack: [([T], [Bool])] = array.enumerated().map {
        var visited = Array(repeating: false, count: array.count)
        visited[$0.offset] = true
        return ([$0.element], visited)
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let elements = now.0
        var visited = now.1
        
        if elements.count == n {
            result.append(elements)
            continue
        }
        
        for i in 0...array.count-1 {
            if visited[i] { continue }
            visited[i] = true
            stack.append((elements + [array[i]], visited))
            visited[i] = false
        }
    }
    
    return result
}
