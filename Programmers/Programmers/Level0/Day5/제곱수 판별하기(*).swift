//
//  제곱수 판별하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 어떤 자연수를 제곱했을 때 나오는 정수를 제곱수라고 합니다.
// 정수 n이 매개변수로 주어질 때, n이 제곱수라면 1을 아니라면 2를 return하도록 solution 함수를 완성해주세요.



// MARK: - 제한사항
// 0 ≤ n ≤ 1,000,000

// MARK: - 문제 해결

import Foundation

func distinguishSquareNumber(_ n: Int) -> Int {
    var number = 1

    while n >= (number * number) {
        if n == (number * number) {
            return 1
        } else {
            number += 1
        }
    }

    return 2
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution6(_ n: Int) -> Int {
    return sqrt(Double(n)) == floor(sqrt(Double(n))) ? 1 : 2
}
