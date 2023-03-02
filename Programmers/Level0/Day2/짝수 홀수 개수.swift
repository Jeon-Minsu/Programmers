//
//  짝수 홀수 개수.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수가 담긴 리스트 num_list가 주어질 때,
// num_list의 원소 중 짝수와 홀수의 개수를 담은 배열을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 1 ≤ num_list의 길이 ≤ 100
// 0 ≤ num_list의 원소 ≤ 1,000

// MARK: - 문제 해결

import Foundation

func obtainOddEvenNumbers(_ num_list:[Int]) -> [Int] {
    let oddNumbers = num_list.filter { $0 % 2 != 0 }.count
    let evenNumbers = num_list.filter { $0 % 2 == 0 }.count

    return [evenNumbers, oddNumbers]
}
