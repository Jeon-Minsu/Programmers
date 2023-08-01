//
//  직각삼각형 출력하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// "*"의 높이와 너비를 1이라고 했을 때, "*"을 이용해 직각 이등변 삼각형을 그리려고합니다.
// 정수 n 이 주어지면 높이와 너비가 n 인 직각 이등변 삼각형을 출력하도록 코드를 작성해보세요.

// MARK: - 제한사항
// 1 ≤ n ≤ 10

// MARK: - 문제 해결

import Foundation

func printRightAngledTriangle() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    var asterisk = "*"

    while asterisk.count <= n.first! {
        print(asterisk)
        asterisk += "*"
    }
}

// MARK: - 본인이 생각하는 모범 답안

func solution() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }

    let length = n.first!
    for i in (1...length) {
        print(String(repeating: "*", count: i))
    }
}
