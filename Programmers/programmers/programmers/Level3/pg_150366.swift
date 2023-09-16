//
//  pg_150366.swift
//  programmers
//
//  Created by sejin on 2023/09/16.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/150366
//  표 병합

import Foundation

func solve150366() {
//    print(solution(["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"]))
    
//    print(solution(["UPDATE 1 1 A", "UPDATE 2 2 B", "UPDATE 3 3 C", "UPDATE 4 4 D", "MERGE 1 1 2 2", "MERGE 3 3 4 4", "MERGE 1 1 3 3", "UNMERGE 1 1", "PRINT 1 1", "PRINT 2 2", "PRINT 3 3", "PRINT 4 4"]))
    print(solution(["MERGE 1 1 2 2", "MERGE 1 1 3 3", "UPDATE 3 3 A", "PRINT 1 1", "PRINT 2 2", "PRINT 3 3"]))
}

fileprivate func solution(_ commands:[String]) -> [String] {
    var table: [[Router]] = []
    var result = [String]()
    
    for i in 0..<51 {
        var routers = [Router]()
        for j in 0..<51 {
            routers.append(Router(value: "EMPTY", inboundCoords: [(i, j)]))
        }
        
        table.append(routers)
    }
    
    for _command in commands {
        let command = _command.components(separatedBy: " ")
        let cmd = command[0]
        
        switch cmd {
        case "UPDATE":
            if command.count == 4 {
                let r = Int(command[1])!
                let c = Int(command[2])!
                let value = command[3]
                let router = table[r][c]
                router.value = value
            } else {
                let value1 = command[1]
                let value2 = command[2]
                update(table: &table, value1: value1, value2: value2)
            }
            
        case "MERGE":
            let r1 = Int(command[1])!
            let c1 = Int(command[2])!
            let r2 = Int(command[3])!
            let c2 = Int(command[4])!
            let router1 = table[r1][c1]
            let router2 = table[r2][c2]
            
            if (r1, c1) == (r2, c2) { break }
            
            
            
            if router1.hasValue && router2.hasValue {
                for (x, y) in router2.inboundCoords {
                    table[x][y] = router1
                }
                router1.inboundCoords.append(contentsOf: router2.inboundCoords)
            } else if router1.hasValue {
                for (x, y) in router2.inboundCoords {
                    table[x][y] = router1
                }
                router1.inboundCoords.append(contentsOf: router2.inboundCoords)
            } else if router2.hasValue {
                for (x, y) in router1.inboundCoords {
                    table[x][y] = router2
                }
                router2.inboundCoords.append(contentsOf: router1.inboundCoords)
            } else {
                table[r2][c2] = router1
                router1.inboundCoords.append((r2, c2))
            }
            
        case "UNMERGE":
            let r = Int(command[1])!
            let c = Int(command[2])!
            let router = table[r][c]
            let value = router.value
            
            for (x, y) in router.inboundCoords {
                let newRouter = Router(value: "EMPTY", inboundCoords: [(x, y)])
                table[x][y] = newRouter
            }
            
            table[r][c].value = value

        case "PRINT":
            let r = Int(command[1])!
            let c = Int(command[2])!
            
            result.append(table[r][c].value)
        default:
            break
        }
    }

    return result
}

fileprivate typealias Coord = (x: Int, y: Int)

fileprivate class Router {
    var value: String
    var inboundCoords = [Coord]()
    var hasValue: Bool {
        return value != "EMPTY"
    }
    
    init(value: String, inboundCoords: [Coord] = []) {
        self.value = value
        self.inboundCoords = inboundCoords
    }
}

fileprivate func update(table: inout [[Router]], value1: String, value2: String) {
    for i in 0..<51 {
        for j in 0..<51 {
            let router = table[i][j]
            
            if router.value == value1 {
                router.value = value2
            }
        }
    }
}

// 디버깅을 위한 table 출력 함수
fileprivate func printTable(_ table: inout [[Router]]) {
    for i in 0..<5 {
        for j in 0..<5 {
            print(table[i][j].value, terminator: " ")
        }
        
        print()
    }
    
    print()
    print()
}
