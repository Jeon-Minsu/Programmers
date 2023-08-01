//
//  큰 수의 법칙.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/01.
//

// MARK: - 문제 설명
// 큰 수의 법칙(page92) 참고

// MARK: - 제한사항
// 큰 수의 법칙(page92) 참고

// MARK: - 문제 해결

func ruleOfBigNumber() {
    var answer = 0
    let firstInput = readLine()!.components(separatedBy: " ").map { Int($0) }
    let secondInput = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: >)

    let maxLength = firstInput[1]!
    let maxRedundancy = firstInput[2]!
    let firstNumber = secondInput[0]
    let secondNumber = secondInput[1]

    let share = maxLength / (maxRedundancy + 1)
    let remainder = maxLength % (maxRedundancy + 1)

    answer += share * (maxRedundancy * firstNumber + secondNumber)
    answer += remainder * firstNumber

    print(answer)
}

// MARK: - 본인이 생각하는 모범 답안
