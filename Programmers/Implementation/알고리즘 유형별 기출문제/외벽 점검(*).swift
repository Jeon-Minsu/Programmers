//
//  외벽 점검.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/11.
//

// MARK: - 문제 설명
//레스토랑을 운영하고 있는 "스카피"는 레스토랑 내부가 너무 낡아 친구들과 함께 직접 리모델링 하기로 했습니다. 레스토랑이 있는 곳은 스노우타운으로 매우 추운 지역이어서 내부 공사를 하는 도중에 주기적으로 외벽의 상태를 점검해야 할 필요가 있습니다.
//
//레스토랑의 구조는 완전히 동그란 모양이고 외벽의 총 둘레는 n미터이며, 외벽의 몇몇 지점은 추위가 심할 경우 손상될 수도 있는 취약한 지점들이 있습니다. 따라서 내부 공사 도중에도 외벽의 취약 지점들이 손상되지 않았는 지, 주기적으로 친구들을 보내서 점검을 하기로 했습니다. 다만, 빠른 공사 진행을 위해 점검 시간을 1시간으로 제한했습니다. 친구들이 1시간 동안 이동할 수 있는 거리는 제각각이기 때문에, 최소한의 친구들을 투입해 취약 지점을 점검하고 나머지 친구들은 내부 공사를 돕도록 하려고 합니다. 편의 상 레스토랑의 정북 방향 지점을 0으로 나타내며, 취약 지점의 위치는 정북 방향 지점으로부터 시계 방향으로 떨어진 거리로 나타냅니다. 또, 친구들은 출발 지점부터 시계, 혹은 반시계 방향으로 외벽을 따라서만 이동합니다.
//
//외벽의 길이 n, 취약 지점의 위치가 담긴 배열 weak, 각 친구가 1시간 동안 이동할 수 있는 거리가 담긴 배열 dist가 매개변수로 주어질 때, 취약 지점을 점검하기 위해 보내야 하는 친구 수의 최소값을 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//n은 1 이상 200 이하인 자연수입니다.
//weak의 길이는 1 이상 15 이하입니다.
//서로 다른 두 취약점의 위치가 같은 경우는 주어지지 않습니다.
//취약 지점의 위치는 오름차순으로 정렬되어 주어집니다.
//weak의 원소는 0 이상 n - 1 이하인 정수입니다.
//dist의 길이는 1 이상 8 이하입니다.
//dist의 원소는 1 이상 100 이하인 자연수입니다.
//친구들을 모두 투입해도 취약 지점을 전부 점검할 수 없는 경우에는 -1을 return 해주세요.

// MARK: - 문제 해결

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func checkOuterWall(_ n: Int, _ weak: [Int], _ dist: [Int]) -> Int {
    // 취약점의 개수
    let numberOfWeakPoints = weak.count
    // 원형으로 구성된 구조를 한 줄을 더하여 일자로 만드는 작업
    // 예시로 n이 12, weak가 [1, 3, 5]가 주어질 때, [1, 3, 5, 13, 15, 17]로 늘림
    let extendedWeakPoints = weak + weak.map { $0 + n }
    // 필요한 최소 인부의 수를 담기 위한 변수
    // Int 최대값으로 먼저 설정하여 이후 min으로 비교후 최신화
    var answer = Int.max

    // 시작하는 취약점을 바꾸기 위한 반복문 생성
    for start in 0..<numberOfWeakPoints {
        // 처음에는 주어진 인부의 이동 가능 거리를 내림차순으로 정렬하면
        // 최소 인부 수로 처리할 수 있을줄 알았으나
        // weak: [120, 160, 200, 210, 250, 280], dist: [40, 30, 10, 0]
        // 위의 예시의 경우 최소 인부가 3명이나 4가 나오는 반례 발견
        // 따라서 순열을 통해 모든 인부 정렬 경우의 수를 대입
        for permutation in generatePermutations(dist) {
            // 현재위치를 시작 지점으로 초기화
            var currentPosition = extendedWeakPoints[start]
            // 사용된 인부의 수
            // 인덱싱을 위해 0으로 시작하고
            // 카운팅을 할때는 이후 +1
            var usedWorkers = 0
            // 시작 인덱스
            var currentIndex = start

            // 각 인부의 이동 가능 거리를 가지고 반복문
            for friendDistance in permutation {
                // 현재 인덱스가 시작 지점부터 모든 취약점 확인할때까지 반복
                // start + numberOfWeakPoints인 이유는
                // 인덱스가 1부터 시작하면 끝나는 인덱스도 1만큼 밀려야하기 때문!
                while currentIndex < start + numberOfWeakPoints {
                    // 다음 취약점까지의 필요 거리
                    let distanceToNextPoint = extendedWeakPoints[currentIndex] - currentPosition

                    // 취약점까지의 거리가 인부의 이동 가능 거리를 초과하면
                    // 이동 못하므로 반복문 종료
                    if distanceToNextPoint > friendDistance {
                        break
                    }

                    // 다음 지점을 확인하기 위하여 인덱스 +1
                    currentIndex += 1
                }

                // 모든 취약점을 점검한 경우
                if currentIndex - start >= numberOfWeakPoints {
                    // 사용된 인부의 수를 이전값과 비교하여 더 작은값으로 업데이트
                    answer = min(answer, usedWorkers + 1)
                    break
                }

                // 다음 취약점으로 현재 위치 업데이트
                currentPosition = extendedWeakPoints[currentIndex]
                // 사용된 인부의 수 +1
                usedWorkers += 1

                // 사용된 인부의 수가 이전보다 많아지면 early break
                if usedWorkers + 1 >= answer {
                    break
                }
            }
        }
    }

    // answer가 초기값 그대로면 모든 취약점을 점검하는 경우가 없는 것
    // 따라서, -1 반환
    if answer == Int.max {
        return -1
    }

    // 사용된 인부의 수 반환
    return answer
}

// 순열을 생성하는 함수
private func generatePermutations(_ elements: [Int]) -> [[Int]] {
    // 요소가 빈 경우, 그냥 빈 배열 반환
    if elements.isEmpty {
        return [[]]
    }

    // 요소가 하나면, swap 할 것도 없으니 그냥 그대로 반환
    if elements.count == 1 {
        return [elements]
    }

    // 전체 순열을 담기 위한 배열 생성
    var entirePermutations: [[Int]] = []

    // 인덱싱을 위한 enumerated() 사용
    // 모든 순열 경우의 수를 다루도록 반복문
    for (index, element) in elements.enumerated() {
        // 기본 배열 복사
        var remainingElements = elements
        // 해당 인덱스에 해당하는 요소 제거
        remainingElements.remove(at: index)

        // 순환함수를 통해 해당 요소를 제외한
        // 나머지 요소들의 모든 경우의 수에 해당하는 배열 반환
        let subPermutations = generatePermutations(remainingElements)

        // 하나하나 모든 경우를 넣기 위한 반복문
        for subPermutation in subPermutations {
            // 일전에 제거한 요소를 넣은 배열 생성
            var permutation = [element]
            // 그 배열의 다음으로 각각의 순열 배열 오소 추가
            permutation.append(contentsOf: subPermutation)
            // 전체 순열 경우의 수에 하나씩 추가
            entirePermutations.append(permutation)
        }
    }

    // 가능한 모든 경우의 수를 포괄한 순열 반환
    return entirePermutations
}
