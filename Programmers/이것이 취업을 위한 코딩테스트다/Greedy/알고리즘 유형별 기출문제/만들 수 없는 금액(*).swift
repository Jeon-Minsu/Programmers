//
//  만들 수 없는 금액.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/09.
//

// MARK: - 문제 설명
// 만들 수 없는 금액(page314) 참고

// MARK: - 제한사항
// 만들 수 없는 금액(page314) 참고

// MARK: - 문제 해결

// MARK: - 본인이 생각하는 모범 답안

import Foundation


func findTheSmallestUnconstructableValue() -> Int {
    let input = readLine()!
    let numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: <)
    var answer = 1

    for i in 0..<numbers.count {
        if numbers[i] > answer {
            break
        }
        answer += numbers[i]
    }

    return answer
}

// 예상치
//7
//2 5 6 9
//

//  1 2 4 5 6 7 8


// 1 2 3 4 8
// 1 2 3 4 5 6 7 8 9 10

// 1 2 4 7
