//
//  숫자 찾기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 정수 num과 k가 매개변수로 주어질 때, num을 이루는 숫자 중에 k가 있으면
// num의 그 숫자가 있는 자리 수를 return하고 없으면 -1을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 0 < num < 1,000,000
// 0 ≤ k < 10
// num에 k가 여러 개 있으면 가장 처음 나타나는 자리를 return 합니다.

// MARK: - 문제 해결

import Foundation

func findNumber(_ num:Int, _ k:Int) -> Int {
    let answer = String(num).enumerated()
        .filter { String($0.element) == String(k) }
        .min { $0.offset < $1.offset }?.offset ?? -2

    return answer + 1
}
