//
//  문자열 재정렬.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/31.
//

// MARK: - 문제
// 문자열 재정렬(page322) 참고

// MARK: - 제한사항
// 문자열 재정렬(page322) 참고

// MARK: - 문제 해결

func realignString() {
    let input = readLine()!.sorted(by: <)
    var letter = ""
    var number = 0

    for element in 0..<input.count {
        if let num = Int(String(input[element])) {
            number += num
        } else {
            letter += String(input[element])
        }
    }

    print("\(letter)\(number)")
}

// MARK: - 본인이 생각하는 모범 답안

func realignString2() {
    let input = readLine()!.sorted(by: <)
    var letter = ""
    var number = 0

    for element in input {
        if element.isNumber {
            number += Int(String(element))!
        } else {
            letter += String(element)
        }
    }

    print("\(letter)\(number)")
}
