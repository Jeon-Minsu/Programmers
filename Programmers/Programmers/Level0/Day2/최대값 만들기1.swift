//
//  최대값 만들기1.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수 배열 numbers가 매개변수로 주어집니다.
// numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.


// MARK: - 제한사항
// 0 ≤ numbers의 원소 ≤ 10,000
// 2 ≤ numbers의 길이 ≤ 100

// MARK: - 문제 해결

import Foundation

func createMaximumIn(_ numbers: [Int]) -> Int {
    let array = numbers.sorted(by: { $0 > $1 })

    return array[0] * array[1]
}
