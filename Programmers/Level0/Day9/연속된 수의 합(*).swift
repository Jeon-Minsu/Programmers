//
//  연속된 수의 합.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/10.
//

// MARK: - 문제 설명
// 연속된 세 개의 정수를 더해 12가 되는 경우는 3, 4, 5입니다.
// 두 정수 num과 total이 주어집니다. 연속된 수 num개를 더한 값이 total이 될 때,
// 정수 배열을 오름차순으로 담아 return하도록 solution함수를 완성해보세요.

// MARK: - 제한사항
// 1 ≤ num ≤ 100
// 0 ≤ total ≤ 1000
// num개의 연속된 수를 더하여 total이 될 수 없는 테스트 케이스는 없습니다.

// MARK: - 문제 해결

import Foundation

func addContinualNumber(_ num:Int, _ total:Int) -> [Int] {
    var answer = 0
    var startNum = 1
    var endNum = num
    var a: [Int] = Array(startNum...endNum)
    answer = a.reduce(0, +)

    while total != answer {
        if total > answer {
            startNum += 1
            endNum += 1

            a = Array(startNum...endNum)
            answer = a.reduce(0, +)
        } else {
            startNum -= 1
            endNum -= 1

            a = Array(startNum...endNum)
            answer = a.reduce(0, +)
        }
    }

    return a.sorted()
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution3(_ num:Int, _ total:Int) -> [Int] {
    let base = (total - (num * (num + 1) / 2)) / num + 1
    return (0..<num).map { $0 + base }
}

func solution4(_ num: Int, _ total: Int) -> [Int] {
    let mid = total / num
    let min = num % 2 == 1 ? mid - (num / 2) : mid - (num / 2 - 1)
    let max = num % 2 == 1 ? mid + (num / 2) : mid + (num / 2)
    return Array(min...max)
}
