//
//  짝수와 홀수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 정수 num이 짝수일 경우 "Even"을 반환하고 홀수인 경우 "Odd"를 반환하는 함수, solution을 완성해주세요.

// MARK: - 제한사항
// num은 int 범위의 정수입니다.
// 0은 짝수입니다.

// MARK: - 문제 해결

func classifyOddOrEven(_ num:Int) -> String {
    return num % 2 == 0 ? "Even" : "Odd"
}

// MARK: - 본인이 생각하는 모범 답안
