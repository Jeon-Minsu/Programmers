//
//  배열 두배 만들기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 정수 배열 numbers가 매개변수로 주어집니다.
// numbers의 각 원소에 두배한 원소를 가진 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// -10,000 ≤ numbers의 원소 ≤ 10,000
// 1 ≤ numbers의 길이 ≤ 1,000


// MARK: - 문제 해결

import Foundation

func double(_ numbers:[Int]) -> [Int] {
    return numbers.map { $0 * 2 }
}
