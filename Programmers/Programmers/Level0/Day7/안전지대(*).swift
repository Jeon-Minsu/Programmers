//
//  안전지대.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/08.
//

// MARK: - 문제 설명
// 다음 그림과 같이 지뢰가 있는 지역과 지뢰에 인접한 위, 아래, 좌, 우 대각선 칸을 모두 위험지역으로 분류합니다.
// 지뢰는 2차원 배열 board에 1로 표시되어 있고 board에는 지뢰가 매설 된 지역 1과, 지뢰가 없는 지역 0만 존재합니다.
// 지뢰가 매설된 지역의 지도 board가 매개변수로 주어질 때, 안전한 지역의 칸 수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// board는 n * n 배열입니다.
// 1 ≤ n ≤ 100
// 지뢰는 1로 표시되어 있습니다.
// board에는 지뢰가 있는 지역 1과 지뢰가 없는 지역 0만 존재합니다.

// MARK: - 문제 해결

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func findSafetyZone(_ board: [[Int]]) -> Int {
    var myBoard = board
    var mineLocation: [(Int, Int)] = []
    var firstOffset: Int = 0
    let length: Int = myBoard.count

    myBoard.enumerated().forEach {
        $0.element.enumerated().forEach {
            if $0.element == 1 {
                mineLocation.append((firstOffset, $0.offset))
            }
        }
        firstOffset += 1
    }

    for i in mineLocation.indices {
        if mineLocation[i].0 - 1 >= 0 {
            myBoard[mineLocation[i].0 - 1][mineLocation[i].1] = 1

            if mineLocation[i].1 - 1 >= 0 {
                myBoard[mineLocation[i].0 - 1][mineLocation[i].1 - 1] = 1
            }

            if mineLocation[i].1 + 1 < length {
                myBoard[mineLocation[i].0 - 1][mineLocation[i].1 + 1] = 1
            }
        }

        if  mineLocation[i].0 + 1 < length {
            myBoard[mineLocation[i].0 + 1][mineLocation[i].1] = 1

            if mineLocation[i].1 - 1 >= 0 {
                myBoard[mineLocation[i].0 + 1][mineLocation[i].1 - 1] = 1
            }

            if mineLocation[i].1 + 1 < length {
                myBoard[mineLocation[i].0 + 1][mineLocation[i].1 + 1] = 1
            }
        }

        if mineLocation[i].1 - 1 >= 0 {
            myBoard[mineLocation[i].0][mineLocation[i].1 - 1] = 1
        }

        if mineLocation[i].1 + 1 < length {
            myBoard[mineLocation[i].0][mineLocation[i].1 + 1] = 1
        }
    }

    return myBoard.flatMap {$0}.filter { $0 == 0 }.count
}
