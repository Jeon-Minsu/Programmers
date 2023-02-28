//
//  짝수의 합.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수 n이 주어질 때,
// n이하의 짝수를 모두 더한 값을 return 하도록 solution 함수를 작성해주세요.

// MARK: - 제한사항
// 0 < n ≤ 1000

// MARK: - 문제 해결

import Foundation

func sumOfEvenNumbers(_ n:Int) -> Int {
    return (1...n).filter { $0 % 2 == 0 }.reduce(0, +)
}
