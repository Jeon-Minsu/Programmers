//
//  특이한 정렬.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 정수 n을 기준으로 n과 가까운 수부터 정렬하려고 합니다.
// 이때 n으로부터의 거리가 같다면 더 큰 수를 앞에 오도록 배치합니다.
// 정수가 담긴 배열 numlist와 정수 n이 주어질 때 numlist의 원소를
// n으로부터 가까운 순서대로 정렬한 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ n ≤ 10,000
// 1 ≤ numlist의 원소 ≤ 10,000
// 1 ≤ numlist의 길이 ≤ 100
// numlist는 중복된 원소를 갖지 않습니다.

// MARK: - 문제 해결

import Foundation

func sortCloseNumber(_ numlist:[Int], _ n:Int) -> [Int] {
//    let answer = numlist.sorted { num1, num2 in
//        return abs(num1 - n) == abs(num2 - n) ? num1 > num2 : abs(num1 - n) < abs(num2 - n)
//    }
//
//    return answer
    return numlist
            .sorted(by: >)
            .sorted(by: { abs($0 - n) < abs($1 - n) })
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    return numlist.sorted(by: { (abs($0 - n), -$0) < (abs($1 - n), -$1) })
}
