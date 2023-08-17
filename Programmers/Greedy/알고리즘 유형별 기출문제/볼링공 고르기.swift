//
//  볼링공 고르기.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/09.
//

// MARK: - 문제 설명
// 볼링공 고르기(page315) 참고

// MARK: - 제한사항
// 볼링공 고르기(page315) 참고

// MARK: - 문제 해결

func pickABowlingBall() -> Int {
    let condition = Int(readLine()!.components(separatedBy: " ").last!)!
    var balls = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: >)
    var answer = 0

    while balls.last != condition, !balls.isEmpty {
        let number = balls.removeLast()
        var count = 1
 
        while number == balls.last {
            balls.removeLast()
            count += 1
        }

        answer += count * balls.count
    }

    return answer
}

// MARK: - 본인이 생각하는 모범 답안



