//
//  가장 큰 수 찾기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 정수 배열 array가 매개변수로 주어질 때, 가장 큰 수와 그 수의 인덱스를 담은 배열을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 1 ≤ array의 길이 ≤ 100
// 0 ≤ array 원소 ≤ 1,000
// array에 중복된 숫자는 없습니다.

// MARK: - 문제 해결

import Foundation

func findTheBiggestNumberIn(_ array:[Int]) -> [Int] {
    let answer = array.enumerated().max { $0.element < $1.element }!

    return [answer.element, answer.offset]
}
