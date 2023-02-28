//
//  순서쌍의 개수.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 순서쌍이란 두 개의 숫자를 순서를 정하여 짝지어 나타낸 쌍으로 (a, b)로 표기합니다.
// 자연수 n이 매개변수로 주어질 때 두 숫자의 곱이 n인 자연수 순서쌍의 개수를 return하도록 solution 함수를 완성해주세요.


// MARK: - 제한사항
// 1 ≤ n ≤ 1,000,000

// MARK: - 문제 해결

import Foundation

func findNumberOfOrderedPair(_ n: Int) -> Int {
    return (1...n).filter { n % $0 == 0 }.count
}
