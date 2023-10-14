//
//  pg_42893.swift
//  programmers
//
//  Created by sejin on 2023/10/14.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/42893
//  매칭 점수

import Foundation

func solve42893() {
//    print(solution("blind", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://a.com\"/>\n</head>  \n<body>\nBlind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. \n<a href=\"https://b.com\"> Link to b </a>\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://b.com\"/>\n</head>  \n<body>\nSuspendisse potenti. Vivamus venenatis tellus non turpis bibendum, \n<a href=\"https://a.com\"> Link to a </a>\nblind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.\n<a href=\"https://c.com\"> Link to c </a>\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://c.com\"/>\n</head>  \n<body>\nUt condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind\n<a href=\"https://a.com\"> Link to a </a>\n</body>\n</html>"]))
    
    print(solution("Muzi", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://careers.kakao.com/interview/list\"/>\n</head>  \n<body>\n<a href=\"https://programmers.co.kr/learn/courses/4673\"></a>#!MuziMuzi!)jayg07con&&\n\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://www.kakaocorp.com\"/>\n</head>  \n<body>\ncon%\tmuzI92apeach&2<a href=\"https://hashcode.co.kr/tos\"></a>\n\n\t^\n</body>\n</html>"]))
    
}

fileprivate func solution(_ word:String, _ pages:[String]) -> Int {
    let pages = pages.map { Page.init(word: word, html: $0) }
    
    for page in pages {
        for link in page.externalLinks {
            if let linkedPage = pages.first(where: { $0.url == link }) {
                linkedPage.referencedLinks.append(page)
            }
        }
    }
    
    let matchingScores = pages.map { $0.matchingScore }
    let maxScore = matchingScores.max()!
    
    return matchingScores.firstIndex(of: maxScore)!
}

fileprivate class Page {
    var url: String = ""
    var externalLinks = [String]()
    var referencedLinks = [Page]()
    var basicScore: Int = 0
    var externalLinkScore: Int {
        externalLinks.count
    }
    var linkScore: Double {
        referencedLinks.map { Double($0.basicScore) / Double($0.externalLinkScore) }.reduce(0, +)
    }
    var matchingScore: Double {
        Double(basicScore) + linkScore
    }

    init(word: String, html: String) {
        let html = html.split(separator: "<").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }.map { $0.lowercased() }.map { "<"+$0 }
        let word = word.lowercased()
        var basicSum = 0
        for tag in html {
            // url 찾기
            if tag.starts(with: "<meta ") {
                parseMetaTag(tag)
            }
            
            if tag.starts(with: "<a ") {
                parseATag(tag)
            }
            
            // 기본 점수 구하기
            basicSum += calculateBasicScore(for: tag, in: word)
        }
        
        self.basicScore = basicSum
    }
    
    func parseMetaTag(_ tag: String) {
        let metaTag = tag.split(separator: " ")
        if metaTag[1].contains("og:url") {
            self.url = String(metaTag[2].dropFirst(9).dropLast(3))
        }
    }
    
    func parseATag(_ tag: String) {
        let link = String(tag.split(separator: ">")[0].dropFirst(9).dropLast())
        self.externalLinks.append(link)
    }
}

fileprivate func calculateBasicScore(for tag: String, in word: String) -> Int {
    // 검색어를 알파벳을 제외한 문자로 분리
    let searchWords = tag.components(separatedBy: CharacterSet.letters.inverted)
    return searchWords.filter { $0 == word }.count
}
