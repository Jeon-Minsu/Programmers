//
//  이상한 문자 만들기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.

// MARK: - 제한사항
// 문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
// 첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.

// MARK: - 문제 해결

func createStrangeString(_ s:String) -> String {
    return s.components(separatedBy: " ").map { text in
        text.enumerated().map { $0.offset % 2 == 0 ? String($0.element).uppercased() : String($0.element).lowercased()
        }.joined()
    }.joined(separator: " ")
}

// MARK: - 본인이 생각하는 모범 답안
