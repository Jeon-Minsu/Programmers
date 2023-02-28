//
//  두 수의 나눗셈.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 정수 num1, num2가 매개변수로 주어질 때,
// num1을 num2로 나눈 값에 1,000을 곱한 후
// 정수 부분을 return 하도록 soltuion 함수를 완성해주세요.

// MARK: - 제한사항
// 0 < num1 ≤ 100
// 0 < num2 ≤ 100

// MARK: - 문제 해결

import Foundation

func divide(_ num1: Int, _ num2: Int) -> Int {
    if (num1 > 0 && num1 <= 100), (num2 > 0 && num2 <= 100) {
        let doubleNum1 = Double(num1)
        let doubleNum2 = Double(num2)
        let answer = doubleNum1 / doubleNum2 * 1000

        return Int(answer)
    }

    return 0
}
