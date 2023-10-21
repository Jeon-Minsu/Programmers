//
//  없는 숫자 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 0부터 9까지의 숫자 중 일부가 들어있는 정수 배열 numbers가 매개변수로 주어집니다. numbers에서 찾을 수 없는 0부터 9까지의 숫자를 모두 찾아 더한 수를 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ numbers의 길이 ≤ 9
// 0 ≤ numbers의 모든 원소 ≤ 9
// numbers의 모든 원소는 서로 다릅니다.

// MARK: - 문제 해결

import Foundation

func sumOfNoMentionedNumber(_ numbers:[Int]) -> Int {
    return (0...9).filter { !numbers.contains($0) }.reduce(0, +)
}

// MARK: - 생각해 볼만한 답안

func solution5(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0, +)
}
