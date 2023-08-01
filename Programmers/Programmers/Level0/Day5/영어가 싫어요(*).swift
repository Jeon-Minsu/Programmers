//
//  영어가 싫어요.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 영어가 싫은 머쓱이는 영어로 표기되어있는 숫자를 수로 바꾸려고 합니다.
// 문자열 numbers가 매개변수로 주어질 때,
// numbers를 정수로 바꿔 return 하도록 solution 함수를 완성해 주세요.

// MARK: - 제한사항
// numbers는 소문자로만 구성되어 있습니다.
// numbers는 "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" 들이 공백 없이 조합되어 있습니다.
// 1 ≤ numbers의 길이 ≤ 50
// "zero"는 numbers의 맨 앞에 올 수 없습니다.

// MARK: - 문제 해결

import Foundation

func convertEnglishToNumber(_ numbers:String) -> Int64 {
    let numberArray = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var answer: [Int] = []
    var word: String = ""

    numbers.forEach { chr in
        word += String(chr)
        if numberArray.contains(word) {
            answer.append(numberArray.firstIndex(of: word)!)
            word = ""
        }
    }

    return Int64(answer.map { String($0) }.joined())!
}

// MARK: - 생각해볼만한 답안

import Foundation

func solution(_ numbers:String) -> Int64 {
    let result = numbers
        .replacingOccurrences(of: "zero", with: "0")
        .replacingOccurrences(of: "one", with: "1")
        .replacingOccurrences(of: "two", with: "2")
        .replacingOccurrences(of: "three", with: "3")
        .replacingOccurrences(of: "four", with: "4")
        .replacingOccurrences(of: "five", with: "5")
        .replacingOccurrences(of: "six", with: "6")
        .replacingOccurrences(of: "seven", with: "7")
        .replacingOccurrences(of: "eight", with: "8")
        .replacingOccurrences(of: "nine", with: "9")

    return Int64(result)!
}
