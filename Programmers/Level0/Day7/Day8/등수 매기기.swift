//
//  등수 매기기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 영어 점수와 수학 점수의 평균 점수를 기준으로 학생들의 등수를 매기려고 합니다.
// 영어 점수와 수학 점수를 담은 2차원 정수 배열 score가 주어질 때,
// 영어 점수와 수학 점수의 평균을 기준으로 매긴 등수를 담은 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 0 ≤ score[0], score[1] ≤ 100
// 1 ≤ score의 길이 ≤ 10
// score의 원소 길이는 2입니다.
// score는 중복된 원소를 갖지 않습니다.

// MARK: - 문제 해결

import Foundation

func rank(_ score:[[Int]]) -> [Int] {
    let sumOfScore = score.map { $0.reduce(0, +) }
    let rank = sumOfScore.sorted(by: >)

    return sumOfScore.map { rank.firstIndex(of: $0)! + 1 }
}

// MARK: - 본인이 생각하는 모범 답안

