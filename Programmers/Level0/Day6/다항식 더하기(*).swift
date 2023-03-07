//
//  다항식 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/07.
//

// MARK: - 문제 설명
// 한 개 이상의 항의 합으로 이루어진 식을 다항식이라고 합니다.
// 다항식을 계산할 때는 동류항끼리 계산해 정리합니다.
// 덧셈으로 이루어진 다항식 polynomial이 매개변수로 주어질 때,
// 동류항끼리 더한 결괏값을 문자열로 return 하도록 solution 함수를 완성해보세요.
// 같은 식이라면 가장 짧은 수식을 return 합니다.

// MARK: - 제한사항
// 0 < polynomial에 있는 수 < 100
// polynomial에 변수는 'x'만 존재합니다.
// polynomial은 0부터 9까지의 정수, 공백, ‘x’, ‘+'로 이루어져 있습니다.
// 항과 연산기호 사이에는 항상 공백이 존재합니다.
// 공백은 연속되지 않으며 시작이나 끝에는 공백이 없습니다.
// 하나의 항에서 변수가 숫자 앞에 오는 경우는 없습니다.
// " + 3xx + + x7 + "와 같은 잘못된 입력은 주어지지 않습니다.
// "012x + 001"처럼 0을 제외하고는 0으로 시작하는 수는 없습니다.
// 문자와 숫자 사이의 곱하기는 생략합니다.
// polynomial에는 일차 항과 상수항만 존재합니다.
// 계수 1은 생략합니다.
// 결괏값에 상수항은 마지막에 둡니다.
// 0 < polynomial의 길이 < 50

// MARK: - 문제 해결

import Foundation

func addPolynomial(_ polynomial: String) -> String {
    let array = polynomial
        .components(separatedBy: " ")
        .joined()
        .components(separatedBy: "+")

    let xArray = array.filter { $0.contains("x") }
        .map { $0 == "x" ? "1x" : $0 }
        .map { Int($0.replacingOccurrences(of: "x", with: ""))! }
        .reduce(0, +)

    let numberArray = array.filter { !$0.contains("x") }
        .map { Int($0)! }
        .reduce(0, +)

    switch (xArray, numberArray) {
    case (0, 0):
        return "0"
    case (0, _):
        return "\(numberArray)"
    case (1, 0):
        return "x"
    case (1, _):
        return "x + \(numberArray)"
    case (_, 0):
        return "\(xArray)x"
    case (_, _):
        return "\(xArray)x + \(numberArray)"
    }
}

// MARK: - 본인이 생각하는 모범 답안

func solution4(_ polynomial: String) -> String {
    var xCount = 0
    var num = 0

    for s in polynomial.split(separator: " ") {
        if s.contains("x") {
            xCount += (s == "x" ? 1 : (Int(s.replacingOccurrences(of: "x", with: "")) ?? 0))
        } else if s != "+" {
            num += Int(s) ?? 0
        }
    }
    return (xCount != 0 ? xCount > 1 ? "\(xCount)x" : "x" : "") + (num != 0 ? "\((xCount != 0 ? " + " : ""))\(num)" : xCount == 0 ? "0" : "")
}
