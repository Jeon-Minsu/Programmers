//
//  음양 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 어떤 정수들이 있습니다. 이 정수들의 절댓값을 차례대로 담은 정수 배열 absolutes와 이 정수들의 부호를 차례대로 담은 불리언 배열 signs가 매개변수로 주어집니다. 실제 정수들의 합을 구하여 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// absolutes의 길이는 1 이상 1,000 이하입니다.
// absolutes의 모든 수는 각각 1 이상 1,000 이하입니다.
// signs의 길이는 absolutes의 길이와 같습니다.
// signs[i] 가 참이면 absolutes[i] 의 실제 정수가 양수임을, 그렇지 않으면 음수임을. 의미합니다.

// MARK: - 문제 해결

import Foundation

func sumOfPlusAndMinusNumbers(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    let indice = signs.enumerated().filter { !$0.element }.map { $0.offset }

    let answer = absolutes.enumerated()
        .map { indice.contains($0.offset) ? -$0.element : $0.element }
        .reduce(0, +)

    return answer
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<absolutes.count).map { signs[$0] ? absolutes[$0] : -absolutes[$0] }.reduce(0, +)
}

func solution2(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    zip(absolutes, signs)
        .map { $1 ? $0 : -$0 }
        .reduce(0, +)
}
