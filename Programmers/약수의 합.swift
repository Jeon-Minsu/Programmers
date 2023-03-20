//
//  약수의 합.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 정수 n을 입력받아 n의 약수를 모두 더한 값을 리턴하는 함수, solution을 완성해주세요.

// MARK: - 제한사항
// n은 0 이상 3000이하인 정수입니다.

// MARK: - 문제 해결

func sumOfDivisor(_ n:Int) -> Int {
    return n == 0 ? 0 : (1...n).filter { n % $0 == 0 }.reduce(0, +)
}

// MARK: - 본인이 생각하는 모범 답안
