//
//  x만큼 간격이 있는 n개의 숫자.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 함수 solution은 정수 x와 자연수 n을 입력 받아,
// x부터 시작해 x씩 증가하는 숫자를 n개 지니는 리스트를 리턴해야 합니다.
// 다음 제한 조건을 보고, 조건을 만족하는 함수, solution을 완성해주세요.

// MARK: - 제한사항
// x는 -10000000 이상, 10000000 이하인 정수입니다.
// n은 1000 이하인 자연수입니다.

// MARK: - 문제 해결

func findNumberSpacedBy(_ x:Int, _ n:Int) -> [Int64] {
    var arr: [Int64] = []

    guard x != 0 else {
        return Array.init(repeating: 0, count: n)
    }

    for num in stride(from: x, through: n * x, by: x) {
        arr.append(Int64(num))
    }

    return arr
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}
