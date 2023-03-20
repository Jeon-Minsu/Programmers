//
//  자릿수 더하기2.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 자연수 N이 주어지면, N의 각 자릿수의 합을 구해서 return 하는 solution 함수를 만들어 주세요.
// 예를들어 N = 123이면 1 + 2 + 3 = 6을 return 하면 됩니다.

// MARK: - 제한사항
// N의 범위 : 100,000,000 이하의 자연수

// MARK: - 문제 해결

func sumOfCiphers(_ n:Int) -> Int {
    return String(n).map { Int(String($0))! }.reduce(0, +)
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution9(_ n:Int) -> Int {
    return String(n).reduce(0, {$0+Int(String($1))!})
}
