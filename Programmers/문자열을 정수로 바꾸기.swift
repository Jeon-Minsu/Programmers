//
//  문자열을 정수로 바꾸기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 문자열 s를 숫자로 변환한 결과를 반환하는 함수, solution을 완성하세요.

// MARK: - 제한사항
// s의 길이는 1 이상 5이하입니다.
// s의 맨앞에는 부호(+, -)가 올 수 있습니다.
// s는 부호와 숫자로만 이루어져있습니다.
// s는 "0"으로 시작하지 않습니다.

// MARK: - 문제 해결

func converStringToInteger(_ s:String) -> Int {
    return Int(s)!
}

// MARK: - 본인이 생각하는 모범 답안
