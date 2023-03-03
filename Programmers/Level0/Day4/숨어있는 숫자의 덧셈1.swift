//
//  숨어있는 숫자의 덧셈1.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/03.
//

// MARK: - 문제 설명
// 문자열 my_string이 매개변수로 주어집니다. my_string안의 모든 자연수들의 합을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ my_string의 길이 ≤ 1,000
// my_string은 소문자, 대문자 그리고 한자리 자연수로만 구성되어있습니다.

// MARK: - 문제 해결

import Foundation

func addNumberIn(_ my_string:String) -> Int {
    return my_string.compactMap { Int(String($0)) }.reduce(0, +)
}
