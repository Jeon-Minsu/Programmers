//
//  이진수 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 이진수를 의미하는 두 개의 문자열 bin1과 bin2가 매개변수로 주어질 때,
// 두 이진수의 합을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// return 값은 이진수를 의미하는 문자열입니다.
// 1 ≤ bin1, bin2의 길이 ≤ 10
// bin1과 bin2는 0과 1로만 이루어져 있습니다.
// bin1과 bin2는 "0"을 제외하고 0으로 시작하지 않습니다.

// MARK: - 문제 해결

import Foundation

func addBinaryNumber(_ bin1:String, _ bin2:String) -> String {
    let number1 = Int(bin1)!
    let number2 = Int(bin2)!
    let sum = ArraySlice(String(number1 + number2))

    var answerArray = [Int]()
    var previousNumber: Int = 0

    sum
        .map { Int(String($0))! }
        .reversed()
        .forEach {
            let criteria = $0 + previousNumber

            switch criteria {
            case 0:
                answerArray.append(0)
                previousNumber = 0
            case 1:
                answerArray.append(1)
                previousNumber = 0
            case 2:
                answerArray.append(0)
                previousNumber = 1
            case 3:
                answerArray.append(1)
                previousNumber = 1
            default:
                return
            }
        }

    if previousNumber != 0 {
        answerArray.append(previousNumber)
    }

    return answerArray.map { String($0) }.reversed().joined()
}

// MARK: - 본인이 생각하는 모범 답안


func solution(_ bin1: String, _ bin2: String) -> String {
    String(Int(bin1, radix: 2)! + Int(bin2, radix: 2)!, radix: 2)
}
