//
//  가운데 글자 가져오기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

// MARK: - 제한사항
// s는 길이가 1 이상, 100이하인 스트링입니다.

// MARK: - 문제 해결

func extractMiddleText(_ s: String) -> String {
    return s.count % 2 == 0 ? String(s.enumerated().filter { $0.offset == s.count / 2 || $0.offset == s.count / 2 - 1 }.map { $0.element }) : String(s.enumerated().filter { $0.offset == s.count / 2 }.map { $0.element })
}

// MARK: - 본인이 생각하는 모범 답안

func solution6(_ s:String) -> String {
    return String(s[String.Index(encodedOffset: (s.count-1)/2)...String.Index(encodedOffset: s.count/2)])
}

func solution7(_ s:String) -> String {
    if Array(s).count % 2 == 0 {
        return String(Array(s)[(s.count/2)-1...(s.count/2)])
    }else{
        return String(Array(s)[s.count/2])
    }
}
