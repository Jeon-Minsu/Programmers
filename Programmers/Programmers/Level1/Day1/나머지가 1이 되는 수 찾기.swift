//
//  나머지가 1이 되는 수 찾기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 자연수 n이 매개변수로 주어집니다.
// n을 x로 나눈 나머지가 1이 되도록 하는 가장 작은 자연수 x를
// return 하도록 solution 함수를 완성해주세요.
// 답이 항상 존재함은 증명될 수 있습니다.

// MARK: - 제한사항
// 3 ≤ n ≤ 1,000,000

// MARK: - 문제 해결

import Foundation

func findNumberWhichTheRestIsOne(_ n:Int) -> Int {
    for number in 1...n {
        if n % number == 1 {
            return number
        }
    }

    return 0
}

// MARK: - 본인이 생각하는 모범 답안
