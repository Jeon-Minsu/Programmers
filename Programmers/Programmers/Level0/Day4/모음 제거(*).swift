//
//  모음 제거.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/03.
//

// MARK: - 문제 설명
// 영어에선 a, e, i, o, u 다섯 가지 알파벳을 모음으로 분류합니다.
// 문자열 my_string이 매개변수로 주어질 때
// 모음을 제거한 문자열을 return하도록 solution 함수를 완성해주세요.



// MARK: - 제한사항
// my_string은 소문자와 공백으로 이루어져 있습니다.
// 1 ≤ my_string의 길이 ≤ 1,000

// MARK: - 문제 해결

import Foundation

func removeVowelIn(_ my_string: String) -> String {
    return my_string.filter { chr in
        switch chr {
        case "a", "e", "i", "o", "u":
            return false
        default:
            return true
        }
    }
}

// MARK: - 본인이 생각하는 모범 답안

func solution1(_ my_string: String) -> String {
    return my_string.filter { !["a", "e", "i", "o", "u"].contains($0)}
}

func solution2(_ my_string: String) -> String {
    return my_string.components(separatedBy: ["a", "e", "i", "o", "u"]).joined()
}
