//
//  pg_258707.swift
//  programmers
//
//  Created by sejin on 1/31/24.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/258707
//  n + 1 카드게임

import Foundation

func solve258707() {
  print(solution(4, [3, 6, 7, 2, 1, 10, 5, 9, 8, 12, 11, 4]))
}

fileprivate func solution(_ coin:Int, _ cards:[Int]) -> Int {
  let n = cards.count
  
  var result = 0
  
  func dfs(cur: Set<Int>, draw: Set<Int>, round: Int, coin: Int) {
    let cardsIndex = n / 3 + round * 2 - 2
    
    result = max(result, round)
    
    if cardsIndex == n {
      return
    }
    
    let newCards = cards[cardsIndex...cardsIndex+1] // 2장 뽑기
    let newDraw = draw.union(newCards)
    
    // 현재 가지고 있는 카드 모음에서 n+1 만들어서 내기
    let cardsAfterUsing0coin = removeTwoCards(cards: cur, n: n)
    
    if cardsAfterUsing0coin.count != cur.count {
      dfs(cur: cardsAfterUsing0coin, draw: newDraw, round: round+1, coin: coin)
      return
    }
    
    if coin >= 1 {
      // coin 1개 써서 지금까지 뽑은 카드 중에서 1개를 가져와서 사용
      let cardsAfterUsing1coin = removeOneCards(cards: cur, drawCards: newDraw, n: n)
      
      if cardsAfterUsing1coin.newCards.count != cur.count {
        dfs(cur: cardsAfterUsing1coin.newCards, draw: cardsAfterUsing1coin.newDrawCards, round: round+1, coin: coin-1)
        return
      }
    }

    if coin >= 2 {
      // coin 2개 써서 지금까지 뽑은 카드 중에서 2개를 가져와서 사용
      let cardsAfterUsing2coin = removeTwoCards(cards: newDraw, n: n)
      
      if cardsAfterUsing2coin.count != newDraw.count {
        dfs(cur: cur, draw: cardsAfterUsing2coin, round: round+1, coin: coin-2)
        return
      }
    }
  }
  
  let startCardsIndex = n/3
  let cur = cards[0..<startCardsIndex]
  dfs(cur: Set(cur), draw: [], round: 1, coin: coin)
  
  return result
}

// 합이 n+1인 카드 2장 내기
fileprivate func removeTwoCards(cards: Set<Int>, n: Int) -> Set<Int> {
  var cards = cards
  
  for num in cards {
    let target = n+1 - num
    
    if cards.contains(target) {
      cards.remove(num)
      cards.remove(target)
      
      return cards
    }
  }
  
  return cards
}

// 합이 n+1인 카드 2장 내기
fileprivate func removeOneCards(cards: Set<Int>, drawCards: Set<Int>, n: Int) -> (newCards: Set<Int>, newDrawCards: Set<Int>) {
  var cards = cards
  var drawCards = drawCards
  
  for num in cards {
    let target = n+1 - num
    
    if drawCards.contains(target) {
      cards.remove(num)
      drawCards.remove(target)
      
      return (cards, drawCards)
    }
  }
  
  return (cards, drawCards)
}
