//
//  두 수의 곱.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 정수 num1, num2가 매개변수 주어집니다.
// num1과 num2를 곱한 값을 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 0 < num1 ≤ 100
// 0 < num2 ≤ 100

// MARK: - 문제 해결

import Foundation

func multiply(_ num1: Int, _ num2: Int) -> Int {
    if 0...100 ~= num1, 0...100 ~= num2 {
        return num1 * num2
    }

    return 0
}
