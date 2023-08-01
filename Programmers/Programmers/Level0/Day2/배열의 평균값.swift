//
//  배열의 평균값.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수 배열 numbers가 매개변수로 주어집니다.
// numbers의 원소의 평균값을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 0 ≤ numbers의 원소 ≤ 1,000
// 1 ≤ numbers의 길이 ≤ 100
// 정답의 소수 부분이 .0 또는 .5인 경우만 입력으로 주어집니다.

// MARK: - 문제 해결

import Foundation

func averageOf(_ numbers: [Int]) -> Double {
    return Double(numbers.reduce(0, +)) / Double(numbers.count)
}
