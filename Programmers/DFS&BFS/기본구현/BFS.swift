//
//  BFS.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/25.
//

import Foundation

func bfs(_ graph: [[Int]], _ start: Int, _ visited: inout [Bool]) {
    var queue: [Int] = []
    queue.append(start)
    visited[start] = true

    while !queue.isEmpty {
        let v = queue.removeFirst()
        print(v, terminator: " ")

        for i in graph[v] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}


// 각 노드가 연결된 정보를 2차원 배열로 표현
let graph2: [[Int]] = [
    [],
    [2, 3, 8],
    [1, 7],
    [1, 4, 5],
    [3, 5],
    [3, 4],
    [7],
    [2, 6, 8],
    [1, 7]
]

// 각 노드가 방문된 정보를 1차원 배열로 표현
var visited2 = [Bool](repeating: false, count: 9)

// 정의된 BFS 함수 호출
//bfs(graph2, 1, &visited2)
