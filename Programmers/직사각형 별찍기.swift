//
//  직사각형 별찍기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 이 문제에는 표준 입력으로 두 개의 정수 n과 m이 주어집니다.
// 별(*) 문자를 이용해 가로의 길이가 n, 세로의 길이가 m인 직사각형 형태를 출력해보세요.

// MARK: - 제한사항
// n과 m은 각각 1000 이하인 자연수입니다.

// MARK: - 문제 해결

import Foundation

func drawRectangleWithAsterisk() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    for _ in 1...b {
        print(String(repeating: "*", count: a))
    }
}

// MARK: - 본인이 생각하는 모범 답안
