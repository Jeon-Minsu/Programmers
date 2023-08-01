//
//  삼각형의 완성조건2.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/08.
//

// MARK: - 문제 설명
// 선분 세 개로 삼각형을 만들기 위해서는 다음과 같은 조건을 만족해야 합니다.
//
// 가장 긴 변의 길이는 다른 두 변의 길이의 합보다 작아야 합니다.
// 삼각형의 두 변의 길이가 담긴 배열 sides이 매개변수로 주어집니다. 나머지 한 변이 될 수 있는 정수의 개수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//sides의 원소는 자연수입니다.
//sides의 길이는 2입니다.
//1 ≤ sides의 원소 ≤ 1,000

// MARK: - 문제 해결

import Foundation

func makeTriangle2(_ sides:[Int]) -> Int {
    let array = sides.sorted(by: >)
    let big = array[0]
    let small = array[1]

    var answer: Int
    var answerSet: Set<Int> = []

    answer = big

    while ((answer + small) > big) && (answer >= 1) {
        answerSet.insert(answer)
        answer -= 1
    }

    answer = big

    while (small + big) > answer {
        answerSet.insert(answer)
        answer += 1
    }

    return answerSet.count
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution3(_ sides:[Int]) -> Int {
    let (minEdge, maxEdge) = (sides.min()!, sides.max()!)
    let case1 = (1..<maxEdge).filter { minEdge + $0 > maxEdge }.count
    let case2 = (maxEdge..<(minEdge + maxEdge)).filter { minEdge + maxEdge > $0 }.count
    return case1 + case2
}
