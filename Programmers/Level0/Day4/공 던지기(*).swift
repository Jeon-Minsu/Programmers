//
//  공 던지기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/02.
//

// MARK: - 문제 설명
// 머쓱이는 친구들과 동그랗게 서서 공 던지기 게임을 하고 있습니다.
// 공은 1번부터 던지며 오른쪽으로 한 명을 건너뛰고 그다음 사람에게만 던질 수 있습니다.
// 친구들의 번호가 들어있는 정수 배열 numbers와 정수 K가 주어질 때,
// k번째로 공을 던지는 사람의 번호는 무엇인지 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 2 < numbers의 길이 < 100
// 0 < k < 1,000
// numbers의 첫 번째와 마지막 번호는 실제로 바로 옆에 있습니다.
// numbers는 1부터 시작하며 번호는 순서대로 올라갑니다.

// MARK: - 문제 해결

import Foundation

func throwBall(_ numbers: [Int], _ k: Int) -> Int {
    let oddArray = numbers.filter { $0 % 2 != 0 }
    let evenArray = numbers.filter { $0 % 2 == 0 }
    var index = k % numbers.count == 0 ? numbers.count : k % numbers.count

    if index <= Int(ceil(Double(numbers.count) / 2)) {
        return oddArray[index - 1]
    } else {
        index -= Int(ceil(Double(numbers.count) / 2))

        return numbers.count % 2 != 0 ? evenArray[index - 1] : oddArray[index - 1]
    }
}

// MARK: - 본인이 생각하는 모범 답안

func solution2(_ numbers: [Int], _ k: Int) -> Int {
    return (1...k).map { _ in numbers }.flatMap { $0 }[2 * (k - 1)]
}
