//
//  약수의 개수와 덧셈.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ left ≤ right ≤ 1,000

// MARK: - 문제 해결

import Foundation

func sumAccordingToTheNumberOfDenominators(_ left:Int, _ right:Int) -> Int {
    return Array(left...right).map { num in
        let number = (1...num).filter { num % $0 == 0 }.count
        return number % 2 == 0 ? num : -num
    }.reduce(0, +)
}

// MARK: - 본인이 생각하는 모범 답안

func solution6(_ left: Int, _ right: Int) -> Int {
    return (left...right).map { i in (1...i).filter { i % $0 == 0 }.count % 2 == 0 ? i : -i }.reduce(0, +)
}
