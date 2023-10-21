//
//  옹알이 (2).swift
//  Programmers
//
//  Created by 전민수 on 2023/03/30.
//

// MARK: - 문제 설명
//머쓱이는 태어난 지 11개월 된 조카를 돌보고 있습니다. 조카는 아직 "aya", "ye", "woo", "ma" 네 가지 발음과 네 가지 발음을 조합해서 만들 수 있는 발음밖에 하지 못하고 연속해서 같은 발음을 하는 것을 어려워합니다. 문자열 배열 babbling이 매개변수로 주어질 때, 머쓱이의 조카가 발음할 수 있는 단어의 개수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//1 ≤ babbling의 길이 ≤ 100
//1 ≤ babbling[i]의 길이 ≤ 30
//문자열은 알파벳 소문자로만 이루어져 있습니다.

// MARK: - 문제 해결

import Foundation

func babble2(_ babbling:[String]) -> Int {
    var count = 0
    let possibleWord = ["aya", "ye", "woo", "ma"]
    let impossibleWord = ["ayaaya", "yeye", "woowoo", "mama"]

    let filteredArray = babbling.filter {
        for word in impossibleWord {
            if $0.contains(word) {
                return false
            }
        }

        return true
    }

    filteredArray.forEach { str in
        var element = str

        for word in possibleWord {
            element = element.replacingOccurrences(of: word, with: "9")

            if Int(element) != nil {
                count += 1
                break
            }
        }
    }

    return count
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ babbling:[String]) -> Int {
    var count: Int = 0
    for element in babbling {
        var str = String(element)
        str = str.replacingOccurrences(of: "aya", with: "1")
        str = str.replacingOccurrences(of: "ye", with: "2")
        str = str.replacingOccurrences(of: "woo", with: "3")
        str = str.replacingOccurrences(of: "ma", with: "4")
        if Int(str) != nil && !str.contains("11") && !str.contains("22") && !str.contains("33") && !str.contains("44"){
            count += 1
        }
    }
    return count
}
