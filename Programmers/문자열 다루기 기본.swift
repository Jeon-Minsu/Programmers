//
//  문자열 다루기 기본.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 문자열 s의 길이가 4 혹은 6이고, 숫자로만 구성돼있는지 확인해주는 함수, solution을 완성하세요. 예를 들어 s가 "a234"이면 False를 리턴하고 "1234"라면 True를 리턴하면 됩니다.

// MARK: - 제한사항
//s는 길이 1 이상, 길이 8 이하인 문자열입니다.
//s는 영문 알파벳 대소문자 또는 0부터 9까지 숫자로 이루어져 있습니다.

// MARK: - 문제 해결

func checkString(_ s:String) -> Bool {
    return (s.count == 4 || s.count == 6) && (s == s.filter { $0.isNumber })
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ s:String) -> Bool {
    return Int(s) != nil && (s.count == 4 || s.count == 6)
}
