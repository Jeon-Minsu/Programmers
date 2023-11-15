//
//  다익스트라 알고리즘.swift
//  Programmers
//
//  Created by 전민수 on 11/15/23.
//

import Foundation

func makeDijkstra() {
    // 노드의 개수, 간선의 개수를 입력받기
    let inputNM = readLine()!.split(separator: " ").map { Int($0)! }
    let n = inputNM[0]
    let m = inputNM[1]

    // 시작 노드 번호를 입력받기
    let start = Int(readLine()!)!

    // 각 노드에 연결되어 있는 노드에 대한 정보를 담는 리스트를 만들기
    // n + 1 개로 설정하여 바로 인덱스에 접근하게!
    var graph = [[(Int, Int)]](repeating: [], count: n + 1)

    // 최단 거리 테이블을 모두 무한으로 초기화
    var distance = [Int](repeating: Int.max, count: n + 1)

    // 모든 간선 정보를 입력받기
    for _ in 0..<m {
        let inputABC = readLine()!.split(separator: " ").map { Int($0)! }
        let a = inputABC[0]
        let b = inputABC[1]
        let c = inputABC[2]

        // a번 노드에서 b번 노드로 가는 비용이 c라는 의미
        graph[a].append((b, c))
    }

    func dijkstra(_ start: Int) {
        var q = [(Int, Int)]()

        // 시작 노드로 가기 위한 최단 경로는 0으로 설정하여, 큐에 삽입
        q.append((0, start))
        distance[start] = 0

        while !q.isEmpty {
            // 가장 최단 거리가 짧은 노드에 대한 정보 꺼내기
            let (dist, now) = q.removeFirst()

            // 현재 노드가 이미 처리된 적이 있는 노드라면 무시
            if distance[now] < dist {
                continue
            }

            // 현재 노드와 연결된 다른 인접한 노드들을 확인
            for i in graph[now] {
                let cost = dist + i.1

                // 현재 노드를 거쳐서, 다른 노드로 이동하는 거리가 더 짧은 경우
                if cost < distance[i.0] {
                    distance[i.0] = cost
                    q.append((cost, i.0))
                }
            }
        }
    }

    // 다익스트라 알고리즘을 수행
    dijkstra(start)

    // 모든 노드로 가기 위한 최단 거리를 출력
    for i in 1...n {
        // 도달할 수 없는 경우, 무한(INFINITY)이라고 출력
        if distance[i] == Int.max {
            print("INFINITY")
        }
        // 도달할 수 있는 경우 거리를 출력
        else {
            print(distance[i])
        }
    }

}
