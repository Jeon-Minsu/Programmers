//
//  게임 개발.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/28.
//

// MARK: - 문제 설명
// 게임 개발(page118) 참고

// MARK: - 제한사항
// 게임 개발(page118) 참고

// MARK: - 문제 해결

func developGame() {
    // 맵의 가로, 세로 최대 길이
    let maximumLength = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let columnMaximum = maximumLength[0]
    let rowMaximum = maximumLength[1]

    // 캐릭터에 대한 위치(A, B) 및 바라보는 방향
    let character = readLine()!.components(separatedBy: " ").map { Int($0)! }
    var position: (A: Int, B: Int) = (character[0], character[1])
    var direction = character[2]

    // 전체 맵 지도를 담을 배열
    var mapArray: [[String]] = []
    // 캐릭터가 이동한 거리
    var moveCount = 0
    // 캐릭터가 반시계 방향으로 회전한 횟수
    var rotationCount = 0

    // 사용자 입력한 맵의 모양
    for _ in 0..<columnMaximum {
        let array = readLine()!.components(separatedBy: " ")
        mapArray.append(array)
    }

    // 게임 캐릭터가 최초로 존재하는 위치에 대하여
    // 캐릭터가 이동한 칸임을 문자열 2의 값으로 표시! (0은 육지, 1은 바다를 의미)
    // 캐릭터가 이동한 칸의 개수 + 1
    mapArray[position.0][position.1] = "2"
    moveCount += 1

    // 현재 캐릭터 위치 기준 동서남북 모두 가본 칸이거나 바다로 되어 있는 칸일때,
    // 캐릭터의 뒤에 위치한 칸이 바다라, 뒤로 가지 못할는 경우 break
    while true {
        // 캐릭터를 반시계 방향으로 회전
        // 회전할때 마다 rotationCount + 1
        direction = rotate(direction)
        rotationCount += 1

        // 캐릭터가 가야할 다음 위치
        let nextPosition = goForward(position: position, direction: direction)

        // 맵의 바깥으로 벗어나지 않도록 조건문 추가
        // 그런데 실무의 코딩에서는 이와 같은 예외 케이스를 포괄하여 다루어야 하지만
        // 코딩테스트의 경우에는 입력값이 주어지는 경우가 대부분이기 때문에
        // 예외처리 고려 X => 빠르게 코드 작성을 목표로!
        guard 0..<columnMaximum ~= nextPosition.0,
              0..<rowMaximum ~= nextPosition.1 else {
            continue
        }

        // 다음에 가야할 위치가 육지인 경우 캐릭터는 전진해야함
        if mapArray[nextPosition.0][nextPosition.1] == "0" {
            // 전진한 위치임을 표시하기 위하여 "2"의 값을 할당
            mapArray[nextPosition.0][nextPosition.1] = "2"
            // 캐릭터의 위치 최신화
            position = nextPosition
            // 캐릭터가 이동한 칸 + 1
            moveCount += 1
            // 회전 횟수 초기화
            rotationCount = 0
        }

        // 4번 회전을 끝마쳤음은 곧 바다이거나 이미 간 칸을 의미
        // 뒤로 갈 준비를 해야함
        if rotationCount == 4 {
            // 뒤로 가야 하는 위치
            let prevPosition = goBack(position: position, direction: direction)

            // 뒤로 가야하는 위치가 바다라면 break
            if mapArray[prevPosition.0][prevPosition.1] == "1" {
                break
            } else {
                // 그렇지 않은 경우 캐릭터가 이동한 칸으로 다시 돌아감을 의미
                // 위치 및 회전 횟수 초기화
                position = prevPosition
                rotationCount = 0
            }
        }
    }

    // 캐릭터가 총 이동한 칸의 개수 출력
    print(moveCount)
}

// 캐릭터를 반시계 방향으로 90도 회전하는 메서드
private func rotate(_ direction: Int) -> Int {
    // direction == 0 => "북쪽"
    // direction == 1 => "동쪽"
    // direction == 2 => "남쪽"
    // direction == 3 => "서쪽"
    return direction - 1 >= 0 ? direction - 1 : 3
}

// 캐릭터의 현재 위치와 바라보는 방향을 기준으로 전진하는 메서드
private func goForward(position: (Int, Int), direction: Int) -> (Int, Int) {
    switch direction {
    case 0:
        return (position.0 - 1, position.1)
    case 1:
        return (position.0, position.1 + 1)
    case 2:
        return (position.0 + 1, position.1)
    case 3:
        return (position.0, position.1 - 1)
    default:
        return (-999, -999)
    }
}

// 캐릭터의 현재 위치와 바라보는 방향을 기준으로 후진하는 메서드
private func goBack(position: (Int, Int), direction: Int) -> (Int, Int) {
    switch direction {
    case 0:
        return (position.0 + 1, position.1)
    case 1:
        return (position.0, position.1 - 1)
    case 2:
        return (position.0 - 1, position.1)
    case 3:
        return (position.0, position.1 + 1)
    default:
        return (-999, -999)
    }
}

// 하나하나 위치를 어디를 보고 있는지 나타내도록 print문 작성

//while true {
//    direction = rotate(direction)
//    rotationCount += 1
//
//    let nextPosition = goForward(position: position, direction: direction)
//
//    guard 0..<columnMaximum ~= nextPosition.0,
//          0..<rowMaximum ~= nextPosition.1 else {
//        continue
//    }
//
//    if mapArray[nextPosition.0][nextPosition.1] == "0" {
//        mapArray[nextPosition.0][nextPosition.1] = "2"
//
//        print("##############")
//        print("현재 위치 \(position.0), \(position.1)")
//        print("바라보는 방향 \(direction == 0 ? "북쪽" : direction == 1 ? "동쪽" : direction == 2 ? "남쪽" : "서쪽")")
//        print("다음에 이동할 위치 \(nextPosition.0), \(nextPosition.1)")
//        print("이동하였습니다!!!")
//        print("##############")
//
//        position = nextPosition
//        moveCount += 1
//        rotationCount = 0
//    } else {
//        print("##############")
//        print("현재 위치 \(position.0), \(position.1)")
//        print("바라보는 방향 \(direction == 0 ? "북쪽" : direction == 1 ? "동쪽" : direction == 2 ? "남쪽" : "서쪽")")
//        print("다음에 이동할 위치 \(nextPosition.0), \(nextPosition.1)")
//        print("##############")
//    }
//
//    if rotationCount == 4 {
//        let prevPosition = goBack(position: position, direction: direction)
//
//        if mapArray[prevPosition.0][prevPosition.1] == "1" {
//            print("##############")
//            print("현재 위치 \(position.0), \(position.1)")
//            print("바라보는 방향 \(direction == 0 ? "북쪽" : direction == 1 ? "동쪽" : direction == 2 ? "남쪽" : "서쪽")")
//            print("돌아갈 이전 위치 \(prevPosition.0), \(prevPosition.1)")
//            print("종료하겠습니다")
//            print("##############")
//            break
//        } else {
//            position = prevPosition
//            rotationCount = 0
//
//            print("##############")
//            print("현재 위치 \(position.0), \(position.1)")
//            print("바라보는 방향 \(direction == 0 ? "북쪽" : direction == 1 ? "동쪽" : direction == 2 ? "남쪽" : "서쪽")")
//            print("돌아갈 이전 위치 \(prevPosition.0), \(prevPosition.1)")
//            print("##############")
//        }
//    }
//}
//
//print(mapArray)
//print(moveCount)
