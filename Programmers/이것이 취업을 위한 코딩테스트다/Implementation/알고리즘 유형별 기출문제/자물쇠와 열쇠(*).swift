//
//  자물쇠와 열쇠.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/19.
//

// MARK: - 문제 설명
//고고학자인 "튜브"는 고대 유적지에서 보물과 유적이 가득할 것으로 추정되는 비밀의 문을 발견하였습니다. 그런데 문을 열려고 살펴보니 특이한 형태의 자물쇠로 잠겨 있었고 문 앞에는 특이한 형태의 열쇠와 함께 자물쇠를 푸는 방법에 대해 다음과 같이 설명해 주는 종이가 발견되었습니다.
//
//잠겨있는 자물쇠는 격자 한 칸의 크기가 1 x 1인 N x N 크기의 정사각 격자 형태이고 특이한 모양의 열쇠는 M x M 크기인 정사각 격자 형태로 되어 있습니다.
//
//자물쇠에는 홈이 파여 있고 열쇠 또한 홈과 돌기 부분이 있습니다. 열쇠는 회전과 이동이 가능하며 열쇠의 돌기 부분을 자물쇠의 홈 부분에 딱 맞게 채우면 자물쇠가 열리게 되는 구조입니다. 자물쇠 영역을 벗어난 부분에 있는 열쇠의 홈과 돌기는 자물쇠를 여는 데 영향을 주지 않지만, 자물쇠 영역 내에서는 열쇠의 돌기 부분과 자물쇠의 홈 부분이 정확히 일치해야 하며 열쇠의 돌기와 자물쇠의 돌기가 만나서는 안됩니다. 또한 자물쇠의 모든 홈을 채워 비어있는 곳이 없어야 자물쇠를 열 수 있습니다.
//
//열쇠를 나타내는 2차원 배열 key와 자물쇠를 나타내는 2차원 배열 lock이 매개변수로 주어질 때, 열쇠로 자물쇠를 열수 있으면 true를, 열 수 없으면 false를 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//key는 M x M(3 ≤ M ≤ 20, M은 자연수)크기 2차원 배열입니다.
//lock은 N x N(3 ≤ N ≤ 20, N은 자연수)크기 2차원 배열입니다.
//M은 항상 N 이하입니다.
//key와 lock의 원소는 0 또는 1로 이루어져 있습니다.
//0은 홈 부분, 1은 돌기 부분을 나타냅니다.
//입출력 예
//key    lock    result
//[[0, 0, 0], [1, 0, 0], [0, 1, 1]]    [[1, 1, 1], [1, 1, 0], [1, 0, 1]]    true
//key를 시계 방향으로 90도 회전하고, 오른쪽으로 한 칸, 아래로 한 칸 이동하면 lock의 홈 부분을 정확히 모두 채울 수 있습니다.

// MARK: - 문제 해결

import Foundation

func isUnlockable(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    // 자물쇠의 크기 저장
    let lockSize = lock.count
    // 90도 회전시킨 키 초기화 (처음에는 원래의 키)
    var rotatedKey = key

    // 네 번 반복 (키를 네 방향으로 모두 회전시키기 위함)
    for _ in 0..<4 {
        // 가능한 모든 x 위치에서 검사
        for i in -(lockSize - 1)..<lockSize {
            // 가능한 모든 y 위치에서 검사
            for j in -(lockSize - 1)..<lockSize {
                // 만약 해당 위치에서 맞으면,
                if isMatch(lock, rotatedKey, i, j) {
                    // 잠금 해제가 가능하므로 true 반환 후 종료
                    return true
                }
            }
        }

        // 다음 반복을 위해 키를 시계 방향으로 90도 회전
        rotatedKey = rotateKey90DegreesClockwise(rotatedKey)
    }

    // 네 방향과 모든 위치에 대해 확인한 후에도 안 되면
    // 잠금 해제 불가능하므로 false 반환
    return false
}

// `isMatch` 함수는 주어진 위치에서 키가 자물쇠와 맞는지 확인하는 메서드
private func isMatch(_ lock: [[Int]], _ key: [[Int]], _ x: Int, _ y: Int) -> Bool {
    // 자물쇠 크기
    let lockSize = lock.count
    // 열쇠 크기
    let keySize = key.count
    // 전 탐색을 수월하게 하기 위해서
    // 자물쇠의 크기를 3배로 변경
    // 상하좌우 대각선을 커버하기 위함
    var extendedLock = Array(repeating: Array(repeating: 0, count: lockSize * 3), count: lockSize * 3)

    // 3배로 확장한 자물쇠 리스트에
    // 원본 자물쇠가 가운데 위치하도록 설정
    for i in 0..<lockSize {
        for j in 0..<lockSize {
            extendedLock[i + lockSize][j + lockSize] = lock[i][j]
        }
    }

    // 키의 모든 요소를 순회하여
    for i in 0..<keySize {
        for j in 0..<keySize {
            // 각 키 요소는 확장된 자물쇠 배열의 해당 위치에 더함
            // (x + i + lock.size)와 (y + j + lock.size)는
            // 확장된 자물쇠에서 실제로 키가 추가되어야 할 위치를 계산
            // 즉, 주어진 x, y 좌표에서 확장된 자물쇠에 키를 옮겨 담아주는 역할
            extendedLock[x + i + lockSize][y + j + lockSize] += key[i][j]
        }
    }

    // 원본 자물쇠 영역에서
    for i in lockSize..<(lockSize * 2) {
        for j in lockSize..<(lockSize * 2) {
            // 만약 '1'이 아닌 위치가 있다면
            if extendedLock[i][j] != 1 {
                // 잘못된 위치이므로 false 반환
                return false
            }
        }
    }

    // 모든 위치를 확인한 후에도 문제 없으면 true 반환
    return true
}

// 키를 시계 방향으로 90도 회전
private func rotateKey90DegreesClockwise(_ key: [[Int]]) -> [[Int]] {
    // key의 size
    let size = key.count
    // 회전된 key 배열
    var rotatedKey = Array(repeating: Array(repeating: 0, count: size), count: size)

    // 시계방향으로 90도 회전시 위치할 곳으로 업데이트
    for i in 0..<size {
        for j in 0..<size {
            rotatedKey[i][j] = key[size - 1 - j][i]
        }
    }

    return rotatedKey
}
