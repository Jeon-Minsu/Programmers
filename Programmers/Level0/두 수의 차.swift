//
//  두 수의 차.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 정수 num1과 num2가 주어질 때,
// num1에서 num2를 뺀 값을 return하도록 soltuion 함수를 완성해주세요.

// MARK: - 제한사항
//-50000 ≤ num1 ≤ 50000
//-50000 ≤ num2 ≤ 50000

// MARK: - 문제 해결

import Foundation

func substract(_ num1: Int, _ num2: Int) -> Int {
    if (-50000...50000).contains(num1) && (-50000...50000).contains(num2) {
        return num1 - num2
    }

    return 0
}
