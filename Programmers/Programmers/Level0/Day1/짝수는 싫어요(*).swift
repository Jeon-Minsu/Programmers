//
//  짝수는 싫어요.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 정수 n이 매개변수로 주어질 때,
// n 이하의 홀수가 오름차순으로 담긴 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ n ≤ 100

// MARK: - 문제 해결

import Foundation

func oddNumberedArray(_ n:Int) -> [Int] {
    var array = [Int]()
    var number = 1

    for i in stride(from: 1, through: n, by: +2) {
        number = i == 1 ? number : number + 2
        array.append(number)
    }

    return array
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ n: Int) -> [Int] { (0...n).filter { $0 % 2 == 1 } }
