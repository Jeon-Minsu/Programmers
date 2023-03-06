//
//  인덱스 바꾸기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 문자열 my_string과 정수 num1, num2가 매개변수로 주어질 때,
// my_string에서 인덱스 num1과 인덱스 num2에 해당하는 문자를 바꾼 문자열을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 1 < my_string의 길이 < 100
// 0 ≤ num1, num2 < my_string의 길이
// my_string은 소문자로 이루어져 있습니다.
// num1 ≠ num2

// MARK: - 문제 해결

import Foundation

func changeIndex(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
    let numbers = my_string
        .enumerated()
        .filter { $0.offset == num1 || $0.offset == num2 }
        .map { String($0.element) }

    let answer = my_string.enumerated()
        .map {
            switch $0.offset {
            case num1:
                return numbers[1]
            case num2:
                return numbers[0]
            default:
                return String($0.element)
            }
        }.joined()

    return answer
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ myString: String, _ num1: Int, _ num2: Int) -> String {
    var array = ArraySlice(myString)
    array.swapAt(num1, num2)
    
    return array.map { String($0) }.joined()
}

