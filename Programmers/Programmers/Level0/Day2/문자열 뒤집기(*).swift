//
//  문자열 뒤집기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 문자열 my_string이 매개변수로 주어집니다.
// my_string을 거꾸로 뒤집은 문자열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ my_string의 길이 ≤ 1,000

// MARK: - 문제 해결

import Foundation

func reverseString(_ my_string: String) -> String {
    return my_string.map { String($0) }.reversed().reduce("", +)
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ myString: String) -> String {
    return String(myString.reversed())
}
