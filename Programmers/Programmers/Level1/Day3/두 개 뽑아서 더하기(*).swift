//
//  두 개 뽑아서 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/23.
//

// MARK: - 문제 설명
//정수 배열 numbers가 주어집니다. numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//numbers의 길이는 2 이상 100 이하입니다.
//numbers의 모든 수는 0 이상 100 이하입니다.

// MARK: - 문제 해결

import Foundation

func pickTwoNumbersAndAdd(_ numbers:[Int]) -> [Int] {
    var set: Set<Int> = []

    for i in 0..<numbers.count {
        for j in (i + 1)..<numbers.count {
            set.insert(numbers[i] + numbers[j])
        }
    }

    return Array(set).sorted()
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ numbers:[Int]) -> [Int] {

    var arr:[Int] = []

    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            arr.append(numbers[i]+numbers[j])
        }
    }

    return Set(arr).sorted()
}
