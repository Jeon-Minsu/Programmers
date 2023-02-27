//
//  숫자 비교하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 정수 num1, num2가 매개변수로 주어질 때,
// 두 수가 같으면 1 다르면 -1을 retrun하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 0 ≤ num1 ≤ 10,000
// 0 ≤ num2 ≤ 10,000

// MARK: - 문제 해결

import Foundation

func compare(_ num1: Int, _ num2: Int) -> Int {
    return num1 == num2 ? 1 : -1
}
