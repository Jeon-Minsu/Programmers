//
//  곱하기 혹은 더하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/09.
//

// MARK: - 문제 설명
// 곱하기 혹은 더하기(page312) 참고

// MARK: - 제한사항
// 곱하기 혹은 더하기(page312) 참고

// MARK: - 문제 해결

func addOrMultiply() -> Int {
    var numbers = readLine()!.split(separator: "").reversed().map { Int($0)! }
    var pastNumber = numbers.removeLast()
    
    for _ in 0..<numbers.count {
        let number = numbers.removeLast()
        
        if pastNumber == 0 || pastNumber == 1 || number == 0 || number == 1 {
            pastNumber += number
        } else {
            pastNumber *= number
        }
    }

    return pastNumber
}

// MARK: - 본인이 생각하는 모범 답안

func addOrMultiply2() -> Int {
    var numbers = readLine()!.split(separator: "").reversed().map { Int($0)! }
    var pastNumber = numbers.removeLast()

    for _ in 0..<numbers.count {
        let number = numbers.removeLast()

        if pastNumber <= 1 || number <= 1 {
            pastNumber += number
        } else {
            pastNumber *= number
        }
    }

    return pastNumber
}
