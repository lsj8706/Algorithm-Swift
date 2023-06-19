//
//  pg_62048.swift
//  programmers
//
//  Created by sejin on 2023/06/19.
//
//  https://school.programmers.co.kr/learn/courses/30/lessons/62048
//  멀쩡한 사각형

import Foundation

func pg62048() {
    print(solution(8, 12))
}

fileprivate func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = 0
    var cnt: Int64 = 0
    
    // 기울기
    let slope = Double(h)/Double(w)
    
    // 교점 구하기
    func getIntersection(x: Double) -> Double {
        return (Double(h) * x) / Double(w)     // slope * x 에서 연산 순서만 바꿈 -> 자료형의 오차로 인해 먼저 곱해야 정밀한 계산 가능
    }
    
    func getIntersection(y: Double) -> Double {
        return y / slope
    }
    
    // 우선 h만큼의 블록은 무조건 사용 불가능이다.
    cnt += Int64(h)
    
    for x in 0..<w {
        let x = Double(x)
        let y = getIntersection(x: x)
        
        // h만큼을 더할 때 x값과 겹치는 값이 있기 때문에 그 부분을 제외하고 cnt에 더해준다.
        if floor(y) != y {
            cnt += 1
        }
    }
    
    answer = Int64(w*h) - cnt
    
    return answer
}

/*
 다른 답안들을 보면 GCD (최대공약수)를 이용해 풀고 있었다.
 갑자기 왜 최대공약수지..? 했는데 잘 생각해보면 내가 푼 방식도 결국 최대공약수를 for문으로 구하고 있던 것이었다..!ㅎㅎ
 처음 떠오른 것은 answer = w*h - (w+h) 였는데 이러면 대각선과의 교점이 (정수, 정수)인 경우가 중복 계산되어서 너무 많은 블록을 제거하게 된다.
 따라서 (정수, 정수)가 교점인 부분의 개수는 다시 더해줘야 하는데 이게 내가 for문에서
 
 if floor(y) != y {
    cnt += 1
 }
 
 이렇게 제약을 걸어서 걸러준 것과 동일한 것이다.
 즉, (정수, 정수)인 경우는 h와 w의 최대 공약수의 배수인 곳들이다.
 
 따라서 다른 답안에서 한줄로 풀고 있는
 answer = w*h - (w+h) + gcd(w,h)
 라는 공식은 결국 내가 푼 것과 동일한 원리였다.
*/
