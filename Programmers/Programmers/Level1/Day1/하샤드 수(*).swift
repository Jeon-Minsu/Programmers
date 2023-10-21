//
//  하샤드 수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 양의 정수 x가 하샤드 수이려면 x의 자릿수의 합으로 x가 나누어져야 합니다.
// 예를 들어 18의 자릿수 합은 1+8=9이고, 18은 9로 나누어 떨어지므로 18은 하샤드 수입니다.
// 자연수 x를 입력받아 x가 하샤드 수인지 아닌지 검사하는 함수, solution을 완성해주세요.

// MARK: - 제한사항
// x는 1 이상, 10000 이하인 정수입니다.

// MARK: - 문제 해결

func findHarshadNumber(_ x:Int) -> Bool {
    let divisor = String(x).map { Int(String($0))! }.reduce(0, +)

    return x % divisor == 0
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ x:Int) -> Bool {
    return x % String(x).reduce(0, { $0 + Int(String($1))! }) == 0
}
