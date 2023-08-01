//
//  옹알이.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 머쓱이는 태어난 지 6개월 된 조카를 돌보고 있습니다.
// 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음을 최대 한 번씩 사용해 조합한(이어 붙인) 발음밖에 하지 못합니다.
// 문자열 배열 babbling이 매개변수로 주어질 때,
// 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ babbling의 길이 ≤ 100
// 1 ≤ babbling[i]의 길이 ≤ 15
// babbling의 각 문자열에서 "aya", "ye", "woo", "ma"는 각각 최대 한 번씩만 등장합니다.
// 즉, 각 문자열의 가능한 모든 부분 문자열 중에서 "aya", "ye", "woo", "ma"가 한 번씩만 등장합니다.
// 문자열은 알파벳 소문자로만 이루어져 있습니다.

// MARK: - 문제 해결

import Foundation

func babble(_ babbling:[String]) -> Int {
    let words = ["aya", "ye", "woo", "ma"]
    var count: Int = 0

    babbling.forEach { bab in
        var array: [[String]] = [[bab]]

        for word in words {
            array = array.compactMap({
                $0.flatMap { $0.components(separatedBy: word) }
            })

            if array.flatMap({$0}).filter({$0 != ""}).count == 0 {
                count += 1

                break
            }
        }
    }

    return count
}

// MARK: - 본인이 생각하는 모범 답안
