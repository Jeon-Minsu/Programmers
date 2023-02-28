//
//  최대값 만들기2.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수 배열 numbers가 매개변수로 주어집니다.
// numbers의 원소 중 두 개를 곱해 만들 수 있는 최댓값을 return하도록 solution 함수를 완성해주세요.


// MARK: - 제한사항
// -10,000 ≤ numbers의 원소 ≤ 10,000
// 2 ≤ numbers 의 길이 ≤ 100

// MARK: - 문제 해결

import Foundation

func createMaximum2In(_ numbers: [Int]) -> Int {
    let array = numbers.sorted(by: { $0 > $1 })
    let maximum1 = array[0] * array[1]
    let maximum2 = array[array.count - 1] * array[array.count - 2]

    return max(maximum1, maximum2)
}

// MARK: - 본인이 생각하는 모범 답안

func solution1(_ numbers:[Int]) -> Int {
    var numbers = numbers.sorted(by: <)

    return max(numbers[0] * numbers[1], numbers[numbers.count-1] * numbers[numbers.count - 2])
}
