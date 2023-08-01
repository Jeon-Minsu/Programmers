//
//  유한소수 판별하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/08.
//

// MARK: - 문제 설명
// 소수점 아래 숫자가 계속되지 않고 유한개인 소수를 유한소수라고 합니다.
// 분수를 소수로 고칠 때 유한소수로 나타낼 수 있는 분수인지 판별하려고 합니다. 유한소수가 되기 위한 분수의 조건은 다음과 같습니다.
//
// 기약분수로 나타내었을 때, 분모의 소인수가 2와 5만 존재해야 합니다.
// 두 정수 a와 b가 매개변수로 주어질 때, a/b가 유한소수이면 1을, 무한소수라면 2를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// a, b는 정수
// 0 < a ≤ 1,000
// 0 < b ≤ 1,000

// MARK: - 문제 해결

import Foundation

func determineFiniteDecimal(_ a:Int, _ b:Int) -> Int {
    guard 1...1000 ~= a, 1...1000 ~= b else {
        return 2
    }

    let denominatorOfA = (1...a).filter { a % $0 == 0 }
    let denominatorOfB = (1...b).filter { b % $0 == 0 }
    var answer = b

    let greatestCommonDenominator = denominatorOfA.filter { denominatorOfB.contains($0) }.sorted(by: >).first

    if let divisor = greatestCommonDenominator {
        answer /= divisor
    }

    while answer % 2 == 0 {
        answer /= 2
    }

    while answer % 5 == 0 {
        answer /= 5
    }

    return answer == 1 ? answer : 2
}

// MARK: - 본인이 생각하는 모범 답안

func solution5(_ a: Int, _ b: Int) -> Int { a * 1_000 % b == 0 ? 1 : 2 }
