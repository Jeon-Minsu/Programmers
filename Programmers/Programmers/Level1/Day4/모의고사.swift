//
//  모의고사.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/24.
//

// MARK: - 문제 설명
//수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
//
//1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
//2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
//3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
//
//1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.

// MARK: - 제한사항
//시험은 최대 10,000 문제로 구성되어있습니다.
//문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
//가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.

// MARK: - 문제 해결

import Foundation

func rankMockTest(_ answers: [Int]) -> [Int] {
    let one = Array(repeating: [1, 2, 3, 4, 5], count: Int(ceil(Double(answers.count) / 5)))
        .flatMap { $0 }.prefix(answers.count)
    let two = Array(repeating: [2, 1, 2, 3, 2, 4, 2, 5], count: Int(ceil(Double(answers.count) / 8)))
        .flatMap { $0 }.prefix(answers.count)
    let three = Array(repeating: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5], count: Int(ceil(Double(answers.count) / 10)))
        .flatMap { $0 }.prefix(answers.count)

    let aa = zip(answers, one).filter { $0.0 == $0.1 }.count
    let bb = zip(answers, two).filter { $0.0 == $0.1 }.count
    let cc = zip(answers, three).filter { $0.0 == $0.1 }.count

    let max = [aa, bb, cc].max()!
    let arr = [aa, bb, cc].enumerated()
        .filter { $0.element == max }
        .map { $0.offset + 1 }

    return arr
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution4(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
}
