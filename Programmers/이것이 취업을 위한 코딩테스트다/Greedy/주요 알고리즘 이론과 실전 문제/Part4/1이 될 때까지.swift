//
//  1이 될 때까지.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/01.
//

// MARK: - 문제 설명
// 1이 될 때까지(page99) 참고

// MARK: - 제한사항
// 1이 될 때까지(page99) 참고

// MARK: - 문제 해결

func calculateUntilNumberReachesOne() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }

    var number = input[0]
    let divider = input[1]
    var count = 0

    while number != 1 {
        if number % divider == 0 {
            number /= divider
        } else {
            number -= 1
        }

        count += 1
    }

    print(count)
}
