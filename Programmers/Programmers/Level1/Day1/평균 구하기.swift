//
//  평균 구하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 정수를 담고 있는 배열 arr의 평균값을 return하는 함수, solution을 완성해보세요.

// MARK: - 제한사항
// arr은 길이 1 이상, 100 이하인 배열입니다.
// arr의 원소는 -10,000 이상 10,000 이하인 정수입니다.

// MARK: - 문제 해결

func calculateAverage(_ arr:[Int]) -> Double {
    return Double(arr.reduce(0, +)) / Double(arr.count)
}

// MARK: - 본인이 생각하는 모범 답안
