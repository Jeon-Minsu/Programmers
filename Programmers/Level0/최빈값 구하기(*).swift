//
//  최빈값 구하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

// MARK: - 문제 설명
// 최빈값은 주어진 값 중에서 가장 자주 나오는 값을 의미합니다.
// 정수 배열 array가 매개변수로 주어질 때, 최빈값을 return 하도록 solution 함수를 완성해보세요.
// 최빈값이 여러 개면 -1을 return 합니다.

// MARK: - 제한사항
// 0 < array의 길이 < 100
// 0 ≤ array의 원소 < 1000

// MARK: - 문제 해결

import Foundation

func mode(_ array:[Int]) -> Int {
    let set = Set(array)
    var count: Int = 0
    var answer: Int = 0

    for i in set {
        let filteredArray = array.filter { num in
            i == num
        }

        if filteredArray.count > count {
            count = filteredArray.count
            answer = i
        }
    }

    let newArray = array.filter { num in
        num != answer
    }

    let newSet = Set(newArray)

    for i in newSet {
        let filteredArray = array.filter { num in
            i == num
        }

        if filteredArray.count == count {
            return -1
        }
    }

    return answer
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ array: [Int]) -> Int {
    let sorted = Dictionary(grouping: array) { $0 }.sorted { $0.value.count > $1.value.count }
    
    return sorted.count > 1 && sorted[0].value.count == sorted[1].value.count ? -1 : sorted[0].key
}

