//
//  플로이드 워셜 알고리즘.swift
//  Programmers
//
//  Created by 전민수 on 11/15/23.
//

import Foundation

func makeFloydWarshall() {
    // 노드의 개수 및 간선의 개수를 입력받기
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!

    // 2차원 배열(그래프 표현)를 만들고, 모든 값을 무한으로 초기화
    var graph = [[Int]](repeating: [Int](repeating: Int.max, count: n + 1), count: n + 1)

    // 자기 자신에서 자기 자신으로 가는 비용은 0으로 초기화
    for a in 1...n {
        for b in 1...n {
            if a == b {
                graph[a][b] = 0
            }
        }
    }

    // 각 간선에 대한 정보를 입력받아, 그 값으로 초기화
    for _ in 0..<m {
        // A에서 B로 가는 비용은 C라고 설정
        let inputABC = readLine()!.split(separator: " ").map { Int($0)! }
        let a = inputABC[0]
        let b = inputABC[1]
        let c = inputABC[2]
        graph[a][b] = c
    }

    // 점화식에 따라 플로이드 워셜 알고리즘을 수행
    for k in 1...n {
        for a in 1...n {
            for b in 1...n {
                graph[a][b] = min(graph[a][b], graph[a][k] + graph[k][b])
            }
        }
    }

    // 수행된 결과를 출력
    for a in 1...n {
        for b in 1...n {
            // 도달할 수 없는 경우, 무한(INFINITY)이라고 출력
            if graph[a][b] == Int.max {
                print("INFINITY", terminator: " ")
            }
            // 도달할 수 있는 경우 거리를 출력
            else {
                print(graph[a][b], terminator: " ")
            }
        }
        print()  // 줄 바꿈
    }
}
