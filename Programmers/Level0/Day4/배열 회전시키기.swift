//
//  배열 회전시키기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/03.
//

// MARK: - 문제 설명
// 정수가 담긴 배열 numbers와 문자열 direction가 매개변수로 주어집니다.
// 배열 numbers의 원소를 direction방향으로
// 한 칸씩 회전시킨 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 3 ≤ numbers의 길이 ≤ 20
// direction은 "left" 와 "right" 둘 중 하나입니다.

// MARK: - 문제 해결

import Foundation

func rotateArray(_ numbers:[Int], _ direction:String) -> [Int] {
    var newNumbers = numbers

    switch direction {
    case "left":
        let number = newNumbers.removeFirst()
        newNumbers.append(number)

        return newNumbers
    case "right":
        let number = newNumbers.removeLast()
        newNumbers.insert(number, at: 0)

        return newNumbers
    default:
        return numbers
    }
}
