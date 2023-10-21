//
//  미로 탈출.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/25.
//

// MARK: - 문제 설명
// 미로 탈출(page152) 참고

// MARK: - 제한사항
// 미로 탈출(page152) 참고

// MARK: - 문제 해결

func escapeMaze() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let depth = input[0]
    let width = input[1]
    var graph: [[Int]] = []

    for _ in 0..<depth {
        let line = Array(readLine()!).map { Int(String($0))! }
        graph.append(line)
    }

    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]

    func bfs(x: Int, y: Int) {
        var queue: [(Int, Int)] = []
        queue.append((x, y))

        while !queue.isEmpty {
            let current = queue.removeFirst()
            let currentX = current.0
            let currentY = current.1

            for i in 0..<4 {
                let newX = currentX + dx[i]
                let newY = currentY + dy[i]

                if (newX < 0 ) || (newX >= depth) || (newY < 0) || (newY >= width) {
                    continue
                }

                if graph[newX][newY] == 1 {
                    graph[newX][newY] = graph[currentX][currentY] + 1
                    queue.append((newX,newY))
                }
            }
        }
    }

    bfs(x: 0, y: 0)
    print(graph[depth - 1][width - 1])
}
