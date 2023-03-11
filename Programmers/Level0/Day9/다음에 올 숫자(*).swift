//
//  다음에 올 숫자.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/10.
//

// MARK: - 문제 설명
// 등차수열 혹은 등비수열 common이 매개변수로 주어질 때,
// 마지막 원소 다음으로 올 숫자를 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 2 < common의 길이 < 1,000
// -1,000 < common의 원소 < 2,000
// common의 원소는 모두 정수입니다.
// 등차수열 혹은 등비수열이 아닌 경우는 없습니다.
// 등비수열인 경우 공비는 0이 아닌 정수입니다.

// MARK: - 문제 해결

import Foundation

func guessNextNumber(_ common: [Int]) -> Int {
    let array = common
    let commonDifference = array[1] - array[0]

    if array.contains(0) {
        return common.last! + commonDifference
    } else {
        let commonRatio = array[1] / array[0]
        var answer = 0

        var arrayOfCommonDifference = [common[0]]
        var arrayOfCommonRatio = [common[0]]

        for _ in 0..<(array.count - 1) {
            arrayOfCommonDifference.append(arrayOfCommonDifference.last! + commonDifference)
            arrayOfCommonRatio.append(arrayOfCommonRatio.last! * commonRatio)
        }

        if arrayOfCommonDifference == common {
            answer = common.last! + commonDifference
        }

        if arrayOfCommonRatio == common {
            answer = common.last! * commonRatio
        }

        return answer
    }
}

// MARK: - 본인이 생각하는 모범 답안

func solution4(_ common: [Int]) -> Int {
    common[2] - common[1] == common[1] - common[0]
        ? common[common.count - 1] + common[1] - common[0]
        : common[common.count - 1] * common[1] / common[0]
}

// 제한사항을 잘 읽으면 식을 더 쉽게도 쓸 수 있을 것 같음...
