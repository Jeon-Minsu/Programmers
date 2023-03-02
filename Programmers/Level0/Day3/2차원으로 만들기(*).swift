//
//  2차원으로 만들기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/02.
//

// MARK: - 문제 설명
// 정수 배열 num_list와 정수 n이 매개변수로 주어집니다.
// num_list를 다음 설명과 같이 2차원 배열로 바꿔 return하도록 solution 함수를 완성해주세요.
// num_list가 [1, 2, 3, 4, 5, 6, 7, 8] 로 길이가 8이고 n이 2이므로
// num_list를 2 * 4 배열로 다음과 같이 변경합니다.
// 2차원으로 바꿀 때에는 num_list의 원소들을 앞에서부터 n개씩 나눠 2차원 배열로 변경합니다.

// MARK: - 제한사항
// num_list의 길이는 n의 배 수개입니다.
// 0 ≤ num_list의 길이 ≤ 150
// 2 ≤ n < num_list의 길이

// MARK: - 문제 해결

import Foundation

func twoDimensionalArray(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var originalAray = num_list
    var answerArray: [[Int]] = []

    while !originalAray.isEmpty {
        var newArray: [Int] = []

        for _ in 1...n {
            newArray.append(originalAray.removeFirst())
        }

        answerArray.append(newArray)
    }

    return answerArray
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ numList: [Int], _ n: Int) -> [[Int]] {
    var answer = Array(repeating: Array(repeating: 0, count: n), count: numList.count / n)
    var count = 0

    for i in answer.indices {
        for j in answer[i].indices {
            answer[i][j] = numList[count]
            count += 1
        }
    }
    return answer
}

