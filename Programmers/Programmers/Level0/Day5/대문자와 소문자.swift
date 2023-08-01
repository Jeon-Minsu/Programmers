//
//  대문자와 소문자.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 문자열 my_string이 매개변수로 주어질 때,
// 대문자는 소문자로 소문자는 대문자로 변환한 문자열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ my_string의 길이 ≤ 1,000
// my_string은 영어 대문자와 소문자로만 구성되어 있습니다.

// MARK: - 문제 해결

import Foundation

func switchUpperAndLowerCase(_ my_string:String) -> String {
    return my_string.map { $0.isLowercase ? $0.uppercased() : $0.lowercased()}.joined()
}
