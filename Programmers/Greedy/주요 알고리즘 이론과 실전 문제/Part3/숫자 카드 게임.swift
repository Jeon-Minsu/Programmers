//
//  숫자 카드 게임.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/01.
//

// MARK: - 문제 설명
// 숫자 카드 게임(page96) 참고

// MARK: - 제한사항
// 숫자 카드 게임(page96) 참고

// MARK: - 문제 해결

func playNumberCardGame() {
    let rowAndColumnInput = readLine()?.components(separatedBy: " ").map { Int($0)! }
    let row = rowAndColumnInput!.first!
    var array: [[Int]] = []

    for _ in 0..<row {
        let input = readLine()?.components(separatedBy: " ").map { Int($0)! }
        array.append(input!)
    }

    let answer = array.map { $0.min()! }.max()!

    print(answer)
}




