//
//  배열 뒤집기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수가 들어 있는 배열 num_list가 매개변수로 주어집니다.
// num_list의 원소의 순서를 거꾸로 뒤집은 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ num_list의 길이 ≤ 1,000
// 0 ≤ num_list의 원소 ≤ 1,000

// MARK: - 문제 해결

import Foundation

func reverseArray(_ num_list: [Int]) -> [Int] {
    return num_list.reversed()
}
