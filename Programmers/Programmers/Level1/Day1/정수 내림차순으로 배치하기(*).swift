//
//  정수 내림차순으로 배치하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 함수 solution은 정수 n을 매개변수로 입력받습니다.
// n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요.
// 예를들어 n이 118372면 873211을 리턴하면 됩니다.

// MARK: - 제한사항
// n은 1이상 8000000000 이하인 자연수입니다.

// MARK: - 문제 해결

func placeIntegerInDescendingOrder(_ n:Int64) -> Int64 {
    return Int64(String(n).sorted(by: >).map { String($0) }.joined())!
}

// MARK: - 본인이 생각하는 모범 답안

func solution2(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}
