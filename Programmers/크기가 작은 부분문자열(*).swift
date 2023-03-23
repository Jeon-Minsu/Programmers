//
//  크기가 작은 부분문자열.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/23.
//

// MARK: - 문제 설명
//숫자로 이루어진 문자열 t와 p가 주어질 때, t에서 p와 길이가 같은 부분문자열 중에서, 이 부분문자열이 나타내는 수가 p가 나타내는 수보다 작거나 같은 것이 나오는 횟수를 return하는 함수 solution을 완성하세요.
//
//예를 들어, t="3141592"이고 p="271" 인 경우, t의 길이가 3인 부분 문자열은 314, 141, 415, 159, 592입니다. 이 문자열이 나타내는 수 중 271보다 작거나 같은 수는 141, 159 2개 입니다.

// MARK: - 제한사항
//1 ≤ p의 길이 ≤ 18
//p의 길이 ≤ t의 길이 ≤ 10,000
//t와 p는 숫자로만 이루어진 문자열이며, 0으로 시작하지 않습니다.


// MARK: - 문제 해결

import Foundation

func countNumberOfSmallerSubString(_ t:String, _ p:String) -> Int {
    var t = t
    var arr: [Int] = []

    while t.count >= p.count {
        arr.append(Int(t[..<t.index(t.startIndex, offsetBy: p.count)])!)
        t.removeFirst()
    }

    return arr.filter { $0 <= Int(p)! }.count
}

// MARK: - 생각해 볼만한 답안

import Foundation

func solution3(_ t:String, _ p:String) -> Int {
    var answer = 0

    for i in 0 ... t.count - p.count {
        let subStr = t.dropFirst(i).prefix(p.count)
        if let comp = Int(subStr), let val = Int(p) {
            answer += comp - val <= 0 ? 1 : 0
        }
    }

    return answer
}
