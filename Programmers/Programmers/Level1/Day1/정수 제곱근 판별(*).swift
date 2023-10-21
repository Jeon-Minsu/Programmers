//
//  정수 제곱근 판별.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 임의의 양의 정수 n에 대해, n이 어떤 양의 정수 x의 제곱인지 아닌지 판단하려 합니다.
// n이 양의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 양의 정수 x의 제곱이 아니라면 -1을 리턴하는 함수를 완성하세요.

// MARK: - 제한사항
// n은 1이상, 50000000000000 이하인 양의 정수입니다.

// MARK: - 문제 해결

import Foundation

func findSquareNumberOfInteger(_ n:Int64) -> Int64 {
    guard sqrt(Double(n)) == floor(sqrt(Double(n))) else {
        return -1
    }

    let answer = Int64(sqrt(Double(n)) + 1)

    return answer * answer
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ n: Int64) -> Int64 {
    let t = Int64(sqrt(Double(n)))
    return t * t == n ? (t + 1) * (t + 1) : -1
}
