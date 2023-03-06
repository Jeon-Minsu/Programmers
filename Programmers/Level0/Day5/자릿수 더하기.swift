//
//  자릿수 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 정수 n이 매개변수로 주어질 때 n의 각 자리 숫자의 합을 return하도록 solution 함수를 완성해주세요

// MARK: - 제한사항
// 0 ≤ n ≤ 1,000,000

// MARK: - 문제 해결

import Foundation

func addDigits(_ n: Int) -> Int {
    return String(n).map { Int(String($0))! }.reduce(0, +)
}
