//
//  pg_72411.swift
//  programmers
//
//  Created by sejin on 2023/02/27.
//
// https://school.programmers.co.kr/learn/courses/30/lessons/72411
// 메뉴 리뉴얼

import Foundation

func solve72411() {
    print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
}

fileprivate func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    
    var menuListDict = [Int: Set<String>]()
    
    // orders 어레이를 돌면서 가능하 메뉴의 조합을 조합을 통해 구한고 딕셔너리에 저장한다.
    for order in orders {
        let possibleCourseSize = course.filter { $0 <= order.count }
        
        for courseSize in possibleCourseSize {
            let possibleMenu = combination(Array(order).map { String($0) }, courseSize).map { $0.joined() }
            let set = Set(possibleMenu)
            menuListDict[courseSize] = menuListDict[courseSize, default: []].union(set)
        }
    }
    
    // 딕서너리에 저장된 메뉴 리스트를 돌며 2인 이상이 주문한 메뉴 조합 중에 사이즈 별로 가능 많이 주문된 메뉴를 찾아서 result에 더한다.
    for (_, menuList) in menuListDict {
        var temp = [String]()
        var orderedCount = 0
        
        for menu in menuList {
            var count = 0
            for order in orders {
                let orderSet = Set(order)
                let menuSet = Set(menu)
                
                if menuSet.isSubset(of: orderSet) {
                    count += 1
                }
            }
            
            if count < 2 {
                continue
            }
            
            if count > orderedCount {
                temp.removeAll()
                temp.append(menu)
                orderedCount = count
            } else if count == orderedCount {
                temp.append(menu)
            }
        }
        
        result.append(contentsOf: temp)
    }
    
    return result.sorted()
}

fileprivate func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    
    var stack = array.enumerated().map { ([$0.element], $0.offset) }
    
    while stack.count > 0 {
        // print(stack)
        let now = stack.removeLast()
        
        let elements = now.0
        let index = now.1
        
        if elements.count == n {
            result.append(elements.sorted())
            continue
        }
        
        guard index+1 <= array.count-1 else { continue }
        
        for i in index+1...array.count-1 {
            stack.append((elements + [array[i]], i))
        }
        
    }
    
    return result
}
