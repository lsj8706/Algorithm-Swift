//
//  Q_23.swift
//  SwiftCodingTestFighter
//
//  Created by sejin on 2022/11/18.
//
// page 359
// 국영수
//

import Foundation

func solveQ_23() {
    struct Info {
        let name: String
        let korean: Int
        let english: Int
        let math: Int
    }
    
    let n = Int(readLine()!)!
    
    var arr = [Info]()
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ")
        arr.append(Info(name: String(input[0]), korean: Int(input[1])!, english: Int(input[2])!, math: Int(input[3])!))
    }
    
    let sortedArr = arr.sorted {
        if $0.korean == $1.korean {
            if $0.english == $1.english {
                if $0.math == $1.math {
                    return $0.name < $1.name
                } else {
                    return $0.math > $1.math
                }
            } else {
                return $0.english < $1.english
            }
        } else {
            return $0.korean > $1.korean
        }
    }

    for student in sortedArr {
        print(student.name)
    }
}
