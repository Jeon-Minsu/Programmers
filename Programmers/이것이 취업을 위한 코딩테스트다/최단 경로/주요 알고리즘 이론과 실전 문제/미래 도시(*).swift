//
//  미래 도시.swift
//  Programmers
//
//  Created by 전민수 on 11/15/23.
//

// MARK: - 문제 설명
// 미래 도시(page259) 참고

// MARK: - 제한사항
// 미래 도시(page259) 참고

// MARK: - 문제 해결

func futureCity() {
    // 노드의 개수 및 간선의 개수를 입력받기
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let numberOfNodes = input[0]
    let numberOfEdges = input[1]

    // 2차원 배열(그래프 표현)를 만들고, 모든 값을 무한으로 초기화
    // 무한대 값을 아래와 같이 정의한 이유는
    // 이후 Int.max로 초기화된 값과의 합산에 따른
    // 오버플로우 문제 발생 가능하기 때문!
    var graph = [[Int]](repeating: [Int](repeating: Int(1e9), count: numberOfNodes + 1), count: numberOfNodes + 1)

    // 자기 자신에서 자기 자신으로 가는 비용은 0으로 초기화
    for a in 1...numberOfNodes {
        for b in 1...numberOfNodes {
            if a == b {
                graph[a][b] = 0
            }
        }
    }

    // 각 간선에 대한 정보를 입력받아, 그 값으로 초기화
    for _ in 0..<numberOfEdges {
        // A에서 B로 가는 비용은 1로 일정함
        // B에서 A로 가는 비용도 1로 동일함
        let inputAB = readLine()!.split(separator: " ").map { Int($0)! }
        let a = inputAB[0]
        let b = inputAB[1]
        graph[a][b] = 1
        graph[b][a] = 1
    }

    // 점화식에 따라 플로이드 워셜 알고리즘을 수행
    for k in 1...numberOfNodes {
        for a in 1...numberOfNodes {
            for b in 1...numberOfNodes {
                graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
            }
        }
    }

    // K번 회사를 거쳐, 최종적으로 X번 회사로 가는 입력값 저장
    let inputOfPath = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let x = inputOfPath[0]
    let k = inputOfPath[1]

    // 수행된 결과를 출력
    // >= 로 표시한 이유는 각각 Int(1e9)일때는 Int(2e9)이기 때문
    let answer = graph[1][k] + graph[k][x] >= Int(1e9) ? -1 : graph[1][k] + graph[k][x]
    print(answer)
}
