//
//  7의 개수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 머쓱이는 행운의 숫자 7을 가장 좋아합니다.
// 정수 배열 array가 매개변수로 주어질 때, 7이 총 몇 개 있는지 return 하도록 solution 함수를 완성해보세요.



// MARK: - 제한사항
// 1 ≤ array의 길이 ≤ 100
// 0 ≤ array의 원소 ≤ 100,000

// MARK: - 문제 해결

import Foundation

func countSeven(_ array:[Int]) -> Int {
    return array.flatMap { String($0).map { String($0) } }
        .filter { $0 == "7" }
        .count
}
