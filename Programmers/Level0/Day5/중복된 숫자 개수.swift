//
//  중복된 숫자 개수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 정수가 담긴 배열 array와 정수 n이 매개변수로 주어질 때,
// array에 n이 몇 개 있는 지를 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 1 ≤ array의 길이 ≤ 100
// 0 ≤ array의 원소 ≤ 1,000
// 0 ≤ n ≤ 1,000

// MARK: - 문제 해결

import Foundation

func countDuplicateNumberIn(_ array:[Int], _ n:Int) -> Int {
    return array.filter { $0 == n }.count
}
