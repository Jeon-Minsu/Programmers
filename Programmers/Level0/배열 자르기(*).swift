//
//  배열 자르기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 정수 배열 numbers와 정수 num1, num2가 매개변수로 주어질 때,
// numbers의 num1번 째 인덱스부터 num2번째 인덱스까지 자른 정수 배열을
// return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 2 ≤ numbers의 길이 ≤ 30
// 0 ≤ numbers의 원소 ≤ 1,000
// 0 ≤num1 < num2 < numbers의 길이

// MARK: - 문제 해결

import Foundation

func cutArray(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    let newArray = numbers.enumerated().filter { index, element in
        return (num1...num2).contains(index)
    }.map { Int($0.element) }

    return newArray
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    Array(numbers[num1...num2])
}
