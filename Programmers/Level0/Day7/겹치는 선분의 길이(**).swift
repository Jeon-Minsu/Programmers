//
//  겹치는 선분의 길이.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/08.
//

// MARK: - 문제 설명
//선분 3개가 평행하게 놓여 있습니다.
// 세 선분의 시작과 끝 좌표가 [[start, end], [start, end], [start, end]] 형태로
// 들어있는 2차원 배열 lines가 매개변수로 주어질 때,
// 두 개 이상의 선분이 겹치는 부분의 길이를 return 하도록 solution 함수를 완성해보세요.
//
// lines가 [[0, 2], [-3, -1], [-2, 1]]일 때 그림으로 나타내면 다음과 같습니다.
// 선분이 두 개 이상 겹친 곳은 [-2, -1], [0, 1]로 길이 2만큼 겹쳐있습니다.

// MARK: - 제한사항
// lines의 길이 = 3
// lines의 원소의 길이 = 2
// 모든 선분은 길이가 1 이상입니다.
// lines의 원소는 [a, b] 형태이며, a, b는 각각 선분의 양 끝점 입니다.
// -100 ≤ a < b ≤ 100

// MARK: - 문제 해결

import Foundation

func calculateLengthOfOverlappedLine(_ lines: [[Int]]) -> Int {
    let newLInes = lines.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }

    let tuple = [(0, 1), (0, 2), (1, 2)]
    var array: [[Int]] = []

    for (i, j) in tuple {
        if newLInes[i][1] > newLInes[j][0] {
            let start = newLInes[j][0]
            let end = min(newLInes[i][1], newLInes[j][1])

            array.append(Array(start...end))
        }
    }

    array.sort(by: { $0.count < $1.count })

    if array.count == 3 {
        let a = array[0].count - 1
        let b = array[1].count - 1
        let c = array[2].count - 1

        let aAndB = array[1].filter({ array[0].contains($0)}).count - 1
        let bAndC = array[2].filter({ array[1].contains($0)}).count - 1
        let cAndA = array[0].filter({ array[2].contains($0)}).count - 1

        let aAndBAndC = array[0].filter({ array[1].contains($0) && array[2].contains($0)}).count - 1

        return a + b + c - (aAndB + bAndC + cAndA) + aAndBAndC
    }

    if array.count == 2 {
        let a = array[0].count - 1
        let b = array[1].count - 1

        let aAndB = (array[1].filter({ array[0].contains($0)}).count - 1) <= 0 ? 0 : (array[1].filter({ array[0].contains($0)}).count - 1)

        return a + b - aAndB
    }

    if array.count == 1 {
        let a = array[0].count - 1

        return a
    }

    return 0
}

//    var newLInes = lines.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
//    //    var answerArray: [Int] = []
//    //
//    //    for i in lines.indices {
//    //        (newLInes[i][0]...newLInes[i][1]).forEach { answerArray.append($0) }
//    //    }
//    //
//    //    for i in answerArray.indices {
//    //        if (i + 1) < answerArray.count,
//    //            answerArray[i] == answerArray[i + 1] {
//    //            answerArray.remove(at: i)
//    //        }
//    //    }
//    //
//    //    let dict = answerArray.reduce(into: [:]) { dict, element in
//    //        dict[element, default: 0] += 1
//    //    }
//    //
//    //    let newDict = dict.filter { $0.value > 1 }.keys.sorted(by: <)
//    //
//    //    return newDict.count == 0 ? 0 : newDict.count - (((newDict.min()!...newDict.max()!).count - 1) - (newDict.count - 1)) - 1
//    let newLines = lines.sorted { ($0[0], $0[1]) < ($1[0], $1[1]) }
//    var range: [[Int]] = []
//
//    if newLines[0][1] > newLines[1][0] {
//        let minNum = min(newLines[0][1], newLines[1][1])
//
//        range.append(Array(newLines[1][0]...minNum))
//    }
//
//    if newLines[0][1] > newLines[2][0] {
//        let minNum = min(newLines[0][1], newLines[2][1])
//
//        range.append(Array(newLines[2][0]...minNum))
//
//    }
//
//    if newLines[1][1] > newLines[2][0] {
//        let minNum = min(newLines[1][1], newLines[2][1])
//
//        range.append(Array(newLines[2][0]...minNum))
//    }
//
//    range.sort { $0.count > $1.count }
//
//    if range.count == 3 {
//        let minus1 = range[1].filter({ range[0].contains($0) }).count - 1
//        let minus2 = range[2].filter({ range[1].contains($0) || range[0].contains($0) }).count - 1
//
//        let one = range[0].count - 1
//        let two = (range[1].count - 1) - minus1
//        let three = (range[2].count - 1) - minus2
//
//        return one + two + three
//    } else if range.count == 2 {
//        let minus1 = range[1].filter({ range[0].contains($0) }).count - 1
//
//        let one = range[0].count - 1
//        let two = (range[1].count - 1) - minus1
//
//        return one + two
//    } else if range.count == 1 {
//        let one = range[0].count - 1
//
//        return one
//    } else {
//        return 0
//    }

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution2(_ lines: [[Int]]) -> Int {
    let points = lines
        .map { $0.sorted(by: { $0 < $1 }) }
        .map { ($0[0]..<$0[1]).map { $0 } }
        .flatMap { $0 }

    let overlappedPoints: Set<Int> = .init(
        points.filter { point in
            points.firstIndex(of: point) != points.lastIndex(of: point)
        }
    )

    return overlappedPoints.count
}
