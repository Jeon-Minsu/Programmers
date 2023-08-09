//
//  문자열 뒤집기.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/09.
//

// MARK: - 문제 설명
// 문자열 뒤집기(page313) 참고

// MARK: - 제한사항
// 문자열 뒤집기(page313) 참고

// MARK: - 문제 해결

import Foundation


func turnString() -> Int {
    let input = readLine()!
    let numberOfZero = input.split(separator: "0")
    let numberofOne = input.split(separator: "1")

    return min(numberOfZero.count, numberofOne.count)
}

// 예상치
// 0 0 0 0 1 1 1 1 1 0 0 1 1 0

// 시행착오
//    let input = readLine()!.split(separator: "").map { Int($0)! }
//    var totalZeroArray: [[Int]] = []
//    var totalOneArray: [[Int]] = []
//    var currentZeroArray: [Int] = []
//    var currentOneArray: [Int] = []
//
//    for i in input.indices {
//        let currentInput = input[i]
//        if currentInput == 0 {
//            currentZeroArray.append(currentInput)
//
//            if !currentOneArray.isEmpty {
//                totalOneArray.append(currentOneArray)
//                currentOneArray.removeAll()
//            }
//        } else {
//            currentOneArray.append(currentInput)
//
//            if !currentZeroArray.isEmpty {
//                totalZeroArray.append(currentZeroArray)
//                currentZeroArray.removeAll()
//            }
//        }
//
//        if i == input.count - 1 {
//            if !currentZeroArray.isEmpty {
//                totalZeroArray.append(currentZeroArray)
//            }
//
//            if !currentOneArray.isEmpty {
//                totalOneArray.append(currentOneArray)
//            }
//        }
//    }
//
//    print(totalZeroArray)
//    print(totalOneArray)
//
//    return min(totalZeroArray.count, totalOneArray.count)
