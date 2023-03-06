//
//  한 번만 등장한 문자.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 문자열 s가 매개변수로 주어집니다.
// s에서 한 번만 등장하는 문자를 사전 순으로 정렬한 문자열을 return 하도록 solution 함수를 완성해보세요.
// 한 번만 등장하는 문자가 없을 경우 빈 문자열을 return 합니다.

// MARK: - 제한사항
// 0 < s의 길이 < 1,000
// s는 소문자로만 이루어져 있습니다.

// MARK: - 문제 해결

import Foundation

func findUniqueCharacter(_ s: String) -> String {
    return s.reduce(into: [:]) { dict, chr in
        dict[chr, default: 0] += 1
    }
    .filter { $0.value == 1 }
    .keys.map { String($0) }
    .sorted()
    .joined()
}

// MARK: - 본인이 생각하는 모범 답안

func solution3(_ s: String) -> String {
    return Dictionary(grouping: Array(s).map(String.init), by: { $0 }).filter { $0.value.count <= 1 }
        .map { $0.key }
        .sorted(by: <)
        .joined()
}
