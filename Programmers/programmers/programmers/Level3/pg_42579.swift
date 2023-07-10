//
//  pg_42579.swift
//  programmers
//
//  Created by sejin on 2023/07/10.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42579
//  베스트 앨범

import Foundation

func solve42579() {
    print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500]))
//    print(solution(["classic"], [500]))

}

fileprivate func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var genresDict = [String: Genre]()
    
    for i in genres.indices {
        let genreName = genres[i]
        let play = plays[i]
        
        if let genre = genresDict[genreName] {
            genre.playsCnt[i, default: 0] += play
        } else {
            let genreModel = Genre(name: genreName)
            genreModel.playsCnt[i] = play
            genresDict[genreName] = genreModel
        }
    }
    
    let genresSorted = genresDict.values.sorted(by: { $0.cnt > $1.cnt })
    let result = genresSorted.map { $0.getTop2Plays() }.flatMap { $0 }
    
    return result
}

fileprivate class Genre {
    let name: String
    var playsCnt = [Int: Int]()
    
    var cnt: Int {
        playsCnt.values.reduce(0, +)
    }
    
    init(name: String) {
        self.name = name
    }
    
    func getTop2Plays() -> [Int] {
        let top2 = playsCnt
            .sorted {
                if $0.value == $1.value {
                    return $0.key < $1.key
                } else {
                    return $0.value > $1.value
                }
            }
            .map { $0.key }
            .prefix(2)
        return Array(top2)
    }
}
