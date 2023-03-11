
//  문자열 밀기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/10.
//

// MARK: - 문제 설명

// 문자열 "hello"에서 각 문자를 오른쪽으로 한 칸씩 밀고 마지막 문자는 맨 앞으로 이동시키면 "ohell"이 됩니다.
// 이것을 문자열을 민다고 정의한다면 문자열 A와 B가 매개변수로 주어질 때,
// A를 밀어서 B가 될 수 있다면 밀어야 하는 최소 횟수를 return하고
// 밀어서 B가 될 수 없으면 -1을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 0 < A의 길이 = B의 길이 < 100
// A, B는 알파벳 소문자로 이루어져 있습니다.

// MARK: - 문제 해결

import Foundation

func rotateString(_ A:String, _ B:String) -> Int {
    var forwardA = A
    var backwardA = A
    var forwardCount = 0
    var backwardCount = 0
    let maxCount = A.count

    while (forwardA != B) && (backwardA != B) {
        if forwardCount < maxCount,
           backwardCount < maxCount {
            forwardA = String(forwardA.removeLast()) + forwardA
            backwardA = backwardA + String(backwardA.removeFirst())
            forwardCount += 1
            backwardCount += 1
        } else {
            return -1
        }
    }

    return min(forwardCount, backwardCount)
}

// MARK: - 생각해 볼만한 답안

import Foundation

func solution2(_ A:String, _ B:String) -> Int {
    let arr = (A+A).components(separatedBy: B)
    return arr.count == 1 ? -1 : arr[1].count
}
