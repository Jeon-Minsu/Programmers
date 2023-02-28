//
//  진료 순서 정하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 외과의사 머쓱이는 응급실에 온 환자의 응급도를 기준으로 진료 순서를 정하려고 합니다.
// 정수 배열 emergency가 매개변수로 주어질 때
// 응급도가 높은 순서대로 진료 순서를 정한 배열을 return하도록 solution 함수를 완성해주세요.


// MARK: - 제한사항
// 중복된 원소는 없습니다.
// 1 ≤ emergency의 길이 ≤ 10
// 1 ≤ emergency의 원소 ≤ 100

// MARK: - 문제 해결

import Foundation

func orderTreatmentBy(_ emergency: [Int]) -> [Int] {
    let array = emergency.sorted(by: >)

    let newArray = emergency.map { element in
        Int(array.firstIndex(of: element)!) + 1
    }

    return newArray
}

// MARK: - 본인이 생각하는 모범 답안

func solution3(_ e: [Int]) -> [Int] {
    e.map { e.sorted(by: >).firstIndex(of: $0)! + 1 }
}
