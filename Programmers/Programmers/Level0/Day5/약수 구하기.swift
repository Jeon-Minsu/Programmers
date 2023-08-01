//
//  약수 구하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 정수 n이 매개변수로 주어질 때, n의 약수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ n ≤ 10,000

// MARK: - 문제 해결

import Foundation

func findDivisorsOf(_ n:Int) -> [Int] {
    return (1...n).filter { n % $0 == 0}.sorted()
}
