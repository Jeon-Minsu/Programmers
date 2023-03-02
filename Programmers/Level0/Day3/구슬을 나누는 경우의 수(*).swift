//
//  구슬을 나누는 경우의 수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/02.
//

// MARK: - 문제 설명
// 머쓱이는 구슬을 친구들에게 나누어주려고 합니다.
// 구슬은 모두 다르게 생겼습니다.
// 머쓱이가 갖고 있는 구슬의 개수 balls와
// 친구들에게 나누어 줄 구슬 개수 share이 매개변수로 주어질 때,
// balls개의 구슬 중 share개의 구슬을 고르는 가능한 모든 경우의 수를
// return 하는 solution 함수를 완성해주세요.


// MARK: - 제한사항
// 1 ≤ balls ≤ 30
// 1 ≤ share ≤ 30
// 구슬을 고르는 순서는 고려하지 않습니다.
// share ≤ balls

// MARK: - 문제 해결

import Foundation

func shareBead(_ balls: Int, _ share: Int) -> Int {
    // 1번 풀이
//        guard (1...30) ~= balls, (1...30) ~= share, share <= balls else {
//        return 0
//    }

    //    return (1...balls).reduce(1, *) / (1...(balls-share)).reduce(1, *) / (1...share).reduce(1, *)
//    return ((balls - share + 1)...balls).reduce(1, *) / (1...share).reduce(1, *)

    var a: Decimal = 1
    var b: Decimal = 1

    for i in (balls - share + 1)...balls {
        a *= Decimal(i)
    }

    for j in 1...share {
        b *= Decimal(j)
    }

    return Int(truncating: NSDecimalNumber(decimal: a / b))
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution2(_ balls: Int, _ share:Int) -> Int {
    var result = (balls - share + 1...balls)
        .map { Double($0) }
        .reduce(1.0, *)

    let _ = (1...share).map { result /= Double($0) }

    return Int(result)
}

