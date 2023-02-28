//
//  배열 원소의 길이.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 문자열 배열 strlist가 매개변수로 주어집니다.
// strlist 각 원소의 길이를 담은 배열을 retrun하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ strlist 원소의 길이 ≤ 100
// strlist는 알파벳 소문자, 대문자, 특수문자로 구성되어 있습니다

// MARK: - 문제 해결

import Foundation

func convertElementToLength(_ strlist:[String]) -> [Int] {
    return strlist.map { $0.count }
}
