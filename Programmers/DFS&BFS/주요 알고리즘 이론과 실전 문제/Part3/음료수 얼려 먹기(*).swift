//
//  음료수 얼려 먹기.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/25.
//

// MARK: - 문제 설명
// 음료수 얼려 먹기(page149) 참고

// MARK: - 제한사항
// 음료수 얼려 먹기(page149) 참고

// MARK: - 문제 해결

func freezeDrinks() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let depth = input[0]
    let width = input[1]
    var graph: [[Int]] = []

    for _ in 0..<depth {
        let line = Array(readLine()!).map { Int(String($0))! }
        graph.append(line)
    }

    func dfs(x: Int, y: Int) {
        if (x <= -1) || (x >= depth) || (y <= -1) || (y >= width) {
            return
        }

        if graph[x][y] == 0 {
            graph[x][y] = 1

            dfs(x: x - 1, y: y)
            dfs(x: x + 1, y: y)
            dfs(x: x, y: y - 1)
            dfs(x: x, y: y + 1)
        }
    }

    var result = 0
    for i in 0..<depth {
        for j in 0..<width {
            if graph[i][j] == 0 {
                result += 1
                dfs(x: i, y: j)
            }
        }
    }

    print(result)
}

