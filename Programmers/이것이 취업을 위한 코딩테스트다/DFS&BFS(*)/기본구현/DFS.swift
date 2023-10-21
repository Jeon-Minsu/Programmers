//
//  DFS.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/25.
//

import Foundation

func dfs(_ graph: [[Int]], _ v: Int, _ visited: inout [Bool]) {
    visited[v] = true
    print(v, terminator: " ")

    for i in graph[v] {
        if !visited[i] {
            dfs(graph, i, &visited)
        }
    }
}

// 각 노드가 연결된 정보를 2차원 배열로 표현
let graph: [[Int]] = [
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
var visited = [Bool](repeating: false, count: 9)

// 정의된 DFS 함수 호출
// dfs(graph, 1, &visited)
