//
//  합성수 찾기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/03.
//

// MARK: - 문제 설명
// 약수의 개수가 세 개 이상인 수를 합성수라고 합니다.
// 자연수 n이 매개변수로 주어질 때
// n이하의 합성수의 개수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ n ≤ 100

// MARK: - 문제 해결

import Foundation

func findCompositeNumber(_ n: Int) -> Int {
    let array = (1...n).compactMap { num -> Int? in
        let compositeNumber = (1...num).map { $0 }
            .filter { num % $0 == 0 }

        return compositeNumber.count >= 3 ? num : nil
    }

    return array.count
}

// MARK: - 본인이 생각하는 모범 답안

func solution4(_ n: Int) -> Int {
    (1...n).filter { i in (1...i).filter { i % $0 == 0 }.count > 2 }.count
}
