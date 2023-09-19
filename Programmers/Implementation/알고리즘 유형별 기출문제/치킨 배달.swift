//
//  치킨 배달.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/19.
//

// MARK: - 문제 설명
//크기가 N×N인 도시가 있다. 도시는 1×1크기의 칸으로 나누어져 있다. 도시의 각 칸은 빈 칸, 치킨집, 집 중 하나이다. 도시의 칸은 (r, c)와 같은 형태로 나타내고, r행 c열 또는 위에서부터 r번째 칸, 왼쪽에서부터 c번째 칸을 의미한다. r과 c는 1부터 시작한다.
//
//이 도시에 사는 사람들은 치킨을 매우 좋아한다. 따라서, 사람들은 "치킨 거리"라는 말을 주로 사용한다. 치킨 거리는 집과 가장 가까운 치킨집 사이의 거리이다. 즉, 치킨 거리는 집을 기준으로 정해지며, 각각의 집은 치킨 거리를 가지고 있다. 도시의 치킨 거리는 모든 집의 치킨 거리의 합이다.
//
//임의의 두 칸 (r1, c1)과 (r2, c2) 사이의 거리는 |r1-r2| + |c1-c2|로 구한다.
//
//예를 들어, 아래와 같은 지도를 갖는 도시를 살펴보자.
//
//0 2 0 1 0
//1 0 1 0 0
//0 0 0 0 0
//0 0 0 1 1
//0 0 0 1 2
//0은 빈 칸, 1은 집, 2는 치킨집이다.
//
//(2, 1)에 있는 집과 (1, 2)에 있는 치킨집과의 거리는 |2-1| + |1-2| = 2, (5, 5)에 있는 치킨집과의 거리는 |2-5| + |1-5| = 7이다. 따라서, (2, 1)에 있는 집의 치킨 거리는 2이다.
//
//(5, 4)에 있는 집과 (1, 2)에 있는 치킨집과의 거리는 |5-1| + |4-2| = 6, (5, 5)에 있는 치킨집과의 거리는 |5-5| + |4-5| = 1이다. 따라서, (5, 4)에 있는 집의 치킨 거리는 1이다.
//
//이 도시에 있는 치킨집은 모두 같은 프랜차이즈이다. 프렌차이즈 본사에서는 수익을 증가시키기 위해 일부 치킨집을 폐업시키려고 한다. 오랜 연구 끝에 이 도시에서 가장 수익을 많이 낼 수 있는  치킨집의 개수는 최대 M개라는 사실을 알아내었다.
//
//도시에 있는 치킨집 중에서 최대 M개를 고르고, 나머지 치킨집은 모두 폐업시켜야 한다. 어떻게 고르면, 도시의 치킨 거리가 가장 작게 될지 구하는 프로그램을 작성하시오.

// MARK: - 제한사항
//첫째 줄에 N(2 ≤ N ≤ 50)과 M(1 ≤ M ≤ 13)이 주어진다.
//둘째 줄부터 N개의 줄에는 도시의 정보가 주어진다.
//도시의 정보는 0, 1, 2로 이루어져 있고, 0은 빈 칸, 1은 집, 2는 치킨집을 의미한다. 집의 개수는 2N개를 넘지 않으며, 적어도 1개는 존재한다. 치킨집의 개수는 M보다 크거나 같고, 13보다 작거나 같다.
//첫째 줄에 폐업시키지 않을 치킨집을 최대 M개를 골랐을 때, 도시의 치킨 거리의 최솟값을 출력한다.

// MARK: - 문제 해결

import Foundation

func deliverChicken() {
    // 사용자 입력
    let input = readLine()!.components(separatedBy: " ")
    // 도시의 크긔
    let size = Int(input[0])!
    // 치킨 가게의 수
    let numberOfStore = Int(input[1])!
    // 주택의 위치가 담긴 배열
    var house: [(Int, Int)] = []
    // 치킨 가게의 위치가 담긴 배열
    var store: [(Int, Int)] = []
    // 도시의 최소 치킨 거리의 합
    // 최소값을 이용하기 때문에
    // 초기 설정은 Int.max로 설정
    var answer = Int.max

    // 도시 구조에 대한 사용자 입력 받기
    // i는 몇 번째 row에 해당하는지 표시
    for i in 0..<size {
        let input = readLine()!.split(separator: " ").map { Int($0)! }

        // j는 몇 번째 column에 해당하는지 표시
        // input.enumerated() 해야 현재 y 좌표를 알 수 있음
        for (j, element) in input.enumerated() {
            // 해당 값이 1이면 주택
            if element == 1 {
                house.append((i, j))
                // 해당 값이 2이면 치킨가게
            } else if element == 2 {
                store.append((i, j))
            }
        }
    }

    // 지금까지 존재하는 치킨 가게의 수(store.count)에서
    // 남겨야 할 치킨 가게의 수(numberOfStore)에 따라
    // 어떤 치킨 가게를 남기는게 최소 치킨 거리를 구할지 생각
    // 완전탐색 + 조합(combination)을 통해
    // 최적의 조합을 통해 최소 치킨 거리의 합을 구하기
    for combination in generateCombinations(Array(0..<store.count), numberOfElements: numberOfStore) {
        // 현재 조합에서의 최소값
        var currentMin = 0

        // 각 가구마다
        for h in house {
            // 치킨 가게와의 거리를 담을 배열
            var distances = [Int]()

            // 특정 치킨 가게들만 남아있을때
            // 예를 들어 5개의 치킨가게에서 3개만 남으려면
            // 5C3의 경우만큼 조합 생성
            // 하나의 조합, 예시로 [0, 2, 3]이면
            // 해당 치킨 가게와 집까지의 거리를 계산하여
            // distance 배열에 추가
            for index in combination {
                let s = store[index]
                distances.append(abs(s.0 - h.0) + abs(s.1 - h.1))
            }

            // 그 중 최소 거리를 currentMin에 더하기
            // 이런 방식으로 현재 존재하는 주택의 수만큼 반복
            currentMin += distances.min()!
        }

        // 주택을 모두 돌면 최소값을 비교하여 업데이트
        answer = min(answer, currentMin)
    }

    // 최소 치킨 거리의 합 출력
    print(answer)
}

// 조합을 생성하는 함수
// - elements: 조합의 대상이 되는 정수 배열
// - numberOfElements: 조합으로 선택해야 할 원소의 개수
private func generateCombinations(_ elements: [Int], numberOfElements: Int) -> [[Int]] {
    // 원소의 개수가 0이하거나 원본 배열의 수를 넘어가면 잘못된 입력
    // 제한 사항을 보니 이런 값은 들어가지 않음을 보장하므로
    // 삭제해도 무방
    if numberOfElements <= 0 || numberOfElements > elements.count {
        return []
    }

    // 최후에 반환할 모든 조합의 경우의 수를 담은 배열
    var result = [[Int]]()
    // 현재 조합을 담을 배열
    var currentCombination = [Int]()

    // generateCombination 함수는 재귀적으로 호출되며 조합을 생성
    // - startIndex: 현재 처리 중인 원소의 인덱스
    // - count: 남은 선택해야 할 원소의 개수
    func generateCombination(startIndex: Int, count: Int) {
        // 남은 원소를 다 선택했을 때
        // 즉, currentCombination에 numberOfElements 개의 원소가 추가됐을 때
        if count == 0 {
            // 현재 조합을 결과 배열에 추가하고 함수 종료
            result.append(currentCombination)
            return
        }

        // 현재 원소부터 끝까지 반복하면서 조합 생성
        for i in startIndex..<elements.count {
            // 현재 원소를 현재 조합에 추가
            currentCombination.append(elements[i])
            // 다음 원소를 선택하기 위해 재귀 호출
            generateCombination(startIndex: i + 1, count: count - 1)
            // 현재 원소를 다시 제거하여 다른 조합을 생성할 수 있도록 처리
            currentCombination.removeLast()
        }
    }

    // 초기 호출로
    // 시작 인덱스를 0으로 설정하고
    // generateCombination 함수를 호출
    generateCombination(startIndex: 0, count: numberOfElements)
    // 모든 조합을 생성한 후 결과를 반환
    return result
}
