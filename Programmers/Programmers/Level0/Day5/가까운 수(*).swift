//
//  가까운 수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 정수 배열 array와 정수 n이 매개변수로 주어질 때,
// array에 들어있는 정수 중 n과 가장 가까운 수를 return 하도록
// solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ array의 길이 ≤ 100
// 1 ≤ array의 원소 ≤ 100
// 1 ≤ n ≤ 100
// 가장 가까운 수가 여러 개일 경우 더 작은 수를 return 합니다.

// MARK: - 문제 해결

import Foundation

func findTheNearestNumberIn(_ array: [Int], _ n:Int) -> Int {
    var answerArray = array.map { $0 - n }
        .enumerated()
        .sorted { abs($0.element) < abs($1.element) }

    while answerArray.count >= 2, abs(answerArray[0].element) == abs(answerArray[1].element) {
        if answerArray[0].element < answerArray[1].element {
            answerArray.remove(at: 1)
        } else {
            answerArray.removeFirst()
        }

    }

    let index = answerArray.first?.offset

    return array[index!]
}

// 제한사항 잘 읽기...
// 가장 가까운 수가 여러 개일 경우 더 작은 수를 return 합니다.

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution3(_ array:[Int], _ n:Int) -> Int {
    return array.min(by: { abs($0 - n) < abs($1 - n) })!
}
