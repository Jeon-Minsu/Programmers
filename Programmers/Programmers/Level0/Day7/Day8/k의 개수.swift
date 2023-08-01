//
//  k의 개수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 1부터 13까지의 수에서, 1은 1, 10, 11, 12, 13 이렇게 총 6번 등장합니다.
// 정수 i, j, k가 매개변수로 주어질 때, i부터 j까지 k가 몇 번 등장하는지 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ i < j ≤ 100,000
// 0 ≤ k ≤ 9

// MARK: - 문제 해결

import Foundation

func countSpecificNumber(_ i: Int, _ j: Int, _ k: Int) -> Int {
    return (i...j).flatMap { String($0) }.filter { String($0) == String(k) }.count
}

// MARK: - 본인이 생각하는 모범 답안
