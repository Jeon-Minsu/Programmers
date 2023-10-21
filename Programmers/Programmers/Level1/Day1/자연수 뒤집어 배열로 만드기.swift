//
//  자연수 뒤집어 배열로 만드기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 자연수 n을 뒤집어 각 자리 숫자를 원소로 가지는 배열 형태로 리턴해주세요. 예를들어 n이 12345이면 [5,4,3,2,1]을 리턴합니다.

// MARK: - 제한사항
// n은 10,000,000,000이하인 자연수입니다.

// MARK: - 문제 해결

func flipNaturalNumberToArray(_ n:Int64) -> [Int] {
    return String(n).reversed().map { Int(String($0))! }
}

// MARK: - 본인이 생각하는 모범 답안
