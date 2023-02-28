//
//  특정 문자 제거하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 문자열 my_string과 문자 letter이 매개변수로 주어집니다.
// my_string에서 letter를 제거한 문자열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ my_string의 길이 ≤ 100
// letter은 길이가 1인 영문자입니다.
// my_string과 letter은 알파벳 대소문자로 이루어져 있습니다.
// 대문자와 소문자를 구분합니다.

// MARK: - 문제 해결

import Foundation

func removeSpecificLetter(_ my_string:String, _ letter:String) -> String {
    let a: String = my_string.filter { chr in
        return String(chr) != letter
    }

    return a
}
