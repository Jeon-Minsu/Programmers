//
//  분수의 덧셈.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 첫 번째 분수의 분자와 분모를 뜻하는 numer1, denom1,
// 두 번째 분수의 분자와 분모를 뜻하는 numer2, denom2가 매개변수로 주어집니다.
// 두 분수를 더한 값을 기약 분수로 나타냈을 때,
// 분자와 분모를 순서대로 담은 배열을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 0 <numer1, denom1, numer2, denom2 < 1,000

// MARK: - 문제 해결

import Foundation

func addFractionsOf(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    var numer: Int
    var denom: Int

    guard numer1 > 0 && numer1 < 1000,
          denom1 > 0 && denom1 < 1000,
          numer2 > 0 && numer2 < 1000,
          denom2 > 0 && denom2 < 1000 else {
        return []
    }

    if denom1 == denom2 {
        numer = numer1 + numer2
        denom = denom1
    } else {
        numer = numer1 * denom2 + numer2 * denom1
        denom = denom1 * denom2
    }

    for i in stride(from: denom, to: 1, by: -1) {
        if numer % i == 0 && denom % i == 0 {
            numer = numer / i
            denom = denom / i
        }
    }

    return [numer, denom]
}
