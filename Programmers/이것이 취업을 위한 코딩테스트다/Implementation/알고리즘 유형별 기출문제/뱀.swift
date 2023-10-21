//
//  뱀.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/06.
//

// MARK: - 문제
//'Dummy' 라는 도스게임이 있다. 이 게임에는 뱀이 나와서 기어다니는데, 사과를 먹으면 뱀 길이가 늘어난다. 뱀이 이리저리 기어다니다가 벽 또는 자기자신의 몸과 부딪히면 게임이 끝난다.
//
//게임은 NxN 정사각 보드위에서 진행되고, 몇몇 칸에는 사과가 놓여져 있다. 보드의 상하좌우 끝에 벽이 있다. 게임이 시작할때 뱀은 맨위 맨좌측에 위치하고 뱀의 길이는 1 이다. 뱀은 처음에 오른쪽을 향한다.
//
//뱀은 매 초마다 이동을 하는데 다음과 같은 규칙을 따른다.
//
//먼저 뱀은 몸길이를 늘려 머리를 다음칸에 위치시킨다.
//만약 벽이나 자기자신의 몸과 부딪히면 게임이 끝난다.
//만약 이동한 칸에 사과가 있다면, 그 칸에 있던 사과가 없어지고 꼬리는 움직이지 않는다.
//만약 이동한 칸에 사과가 없다면, 몸길이를 줄여서 꼬리가 위치한 칸을 비워준다. 즉, 몸길이는 변하지 않는다.
//사과의 위치와 뱀의 이동경로가 주어질 때 이 게임이 몇 초에 끝나는지 계산하라.

// MARK: - 제한사항
//첫째 줄에 보드의 크기 N이 주어진다. (2 ≤ N ≤ 100) 다음 줄에 사과의 개수 K가 주어진다. (0 ≤ K ≤ 100)
//
//다음 K개의 줄에는 사과의 위치가 주어지는데, 첫 번째 정수는 행, 두 번째 정수는 열 위치를 의미한다. 사과의 위치는 모두 다르며, 맨 위 맨 좌측 (1행 1열) 에는 사과가 없다.
//
//다음 줄에는 뱀의 방향 변환 횟수 L 이 주어진다. (1 ≤ L ≤ 100)
//
//다음 L개의 줄에는 뱀의 방향 변환 정보가 주어지는데, 정수 X와 문자 C로 이루어져 있으며. 게임 시작 시간으로부터 X초가 끝난 뒤에 왼쪽(C가 'L') 또는 오른쪽(C가 'D')로 90도 방향을 회전시킨다는 뜻이다. X는 10,000 이하의 양의 정수이며, 방향 전환 정보는 X가 증가하는 순으로 주어진다.

// MARK: - 문제 해결

import Foundation

func calculateEndTimeForSnakeGame() {
    // 보드의 크기
    let gameSize = Int(readLine()!)!
    // 뱀의 길이를 늘려주는 사과의 총 개수
    let numberOfApple = Int(readLine()!)!
    // 각 사과의 좌표를 담는 배열
    var apples: [(Int, Int)] = []

    // apples 배열 내 각 사과의 좌표를 넣음
    for _ in 0..<numberOfApple {
        let apple = readLine()!.components(separatedBy: " ").map { Int($0)! }
        apples.append((apple[0], apple[1]))
    }

    // 뱀의 총 방향 전환 횟수
    let numberOfChange = Int(readLine()!)!
    // 뱀의 각 방향 전환 정보를 담는 배열
    var changes: [(Int, String)] = []

    // changes 배열 내 각 방향 전환 정보를 넣음
    // 이른 시간의 방향 전환 정보를 last, removeLast 등으로 접근하여
    // 시간복잡도 면에서 이점을 보기 위해
    // insert를 통해서 후순위 방향 전환 정보들이 앞으로 가도록 삽입
    // insert의 시간복잡도는 O(N)이지만
    // 해당 방향 전환 정보에서 O(N)의 시간 복잡도를 소비하는 편이
    // 이후 뱀의 이동 중 자꾸 removeFirst를 통해 O(N)의 시간 복잡도를 소비하는 것보다
    // 훨씬 유리하다고 판단
    for _ in 0..<numberOfChange {
        let change = readLine()!.components(separatedBy: " ")
        changes.insert((Int(change[0])!, change[1]), at: 0)
    }

    // 해당 게임이 종료되는 시간
    var totalTime = 0
    // 현재 뱀의 이동 경로를 담는 배열
    var currentSnake: [(Int, Int)] = [(1, 1)]
    // 뱀의 이동 방향
    var direction = Direction.right

    // 게임이 끝날때까지 반복문 실행
    while true {
        // 1초마다 시간의 경과
        totalTime += 1
        // 뱀의 머리를 move 함수를 통해 최신화
        // 이전 뱀의 머리 좌표에서 방향을 고려하여 head 위치 옮기기
        let head = move(position: currentSnake.last!, direction: direction)

        // 뱀의 머리가 게임 보드판을 벗어나면 게임 종료
        if head.0 < 1 || head.1 < 1 || head.0 > gameSize || head.1 > gameSize {
            break
        }

        // 해당 조건문은 뱀의 머리가 자신의 몸과 부딪히는지 판단하기 위한 조건문
        // 뱀의 몸이 1이라면 자신의 몸에 부딪힐 일이 없으니
        // 불필요하게 몸에 닿는지 확인할 필요 X
        // 따라서, 뱀의 몸이 1보다 클 때만 contains 함수를 돌려 시간복잡도 이점 챙김
        // 뱀의 머리가 몸에 닿았으면 게임 종료
        if currentSnake.count > 1 {
            if currentSnake.contains(where: { body in
                body.0 == head.0 && body.1 == head.1
            }) {
                break
            }
        }

        // 방향 전환 정보가 있을때 (!changes.isEmpty)
        // 방향 전환 시간과 현재 시간이 같아지면 (totalTime == changes.last!.0)
        // 현재 머리가 향하는 방향과 전환 방향을 중심으로 방향 전환
        // 그리고 방향 전환 이후 해당 정보는 삭제
        if !changes.isEmpty, totalTime == changes.last!.0 {
            direction = rotate(to: changes.last!.1, direction: direction)!
            changes.removeLast()
        }

        // 사과들이 남아있을때 (!apples.isEmpty,)
        // 현재 머리가 사과에 위치 한다면
        if !apples.isEmpty, apples.contains(where: { apple in
            apple.0 == head.0 && apple.1 == head.1
        }) {
            // 해당 사과는 먹었으니 제거
            apples.removeAll { apple in
                apple.0 == head.0 && apple.1 == head.1
            }
            // 그리고 뱀의 머리를 사과를 먹은 위치까지 늘리기
            currentSnake.append(head)
        // 사과를 먹지 않은 경우 중에
        // 뱀의 몸 길이가 1보다 크다면
        } else if currentSnake.count > 1 {
            // 머리를 현재 위치로 옮기고
            // 마지막 꼬리 위치도 땡겨지기 때문에 삭제
            currentSnake.removeFirst()
            currentSnake.append(head)
        } else {
            // 그러나 뱀의 몸 길이가 1이면 머리밖에 없으니
            // 그냥 원래의 위치를 없애고
            // 현재 위치로 최신화
            currentSnake.removeLast()
            currentSnake.append(head)
        }
    }

    // 게임 종료 시간 출력
    print(totalTime)
}

// 뱀이 이동할 방향
enum Direction {
    case up
    case down
    case left
    case right
}

// 뱀의 머리 방향에 따른 이동한 위치를 반환하는 함수
private func move(position: (Int, Int), direction: Direction) -> (Int, Int) {
    switch direction {
    case .up:
        return (position.0 - 1, position.1)
    case .down:
        return (position.0 + 1, position.1)
    case .left:
        return (position.0, position.1 - 1)
    case .right:
        return (position.0, position.1 + 1)
    }
}

// 현재 뱀의 이동 방향과 전환 방향을 중심으로
// 최종적으로 어느 방향으로 가야하는지 반환하는 함수
// nil을 통해 default 처리
private func rotate(to rotation: String, direction: Direction) -> Direction? {
    switch (rotation, direction) {
    case ("L", .up):
        return .left
    case ("L", .down):
        return .right
    case ("L", .left):
        return .down
    case ("L", .right):
        return .up
    case ("D", .up):
        return .right
    case ("D", .down):
        return .left
    case ("D", .left):
        return .up
    case ("D", .right):
        return .down
    default:
        return nil
    }
}
