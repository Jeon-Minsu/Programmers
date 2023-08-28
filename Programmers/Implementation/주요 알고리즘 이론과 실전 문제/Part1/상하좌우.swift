//
//  상하좌우.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/28.
//

// MARK: - 문제 설명
// 상하좌우(page110) 참고

// MARK: - 제한사항
// 상하좌우(page110) 참고

// MARK: - 문제 해결

func upDownLeftRight() {
    // 시작점 변수 추가
    var startPoint = (1, 1)

    // 최대 이동 가능 거리 입력 받기
    let maximumLength = Int(readLine()!)!

    // 사용자가 입력한 이동 경로를 배열로 저장
    let operation = readLine()!.components(separatedBy: " ")

    // 각 입력에 따른 위치 이동
    // Up => 1보다 올라갈 수 없음
    // Down => maximumLength보다 내려갈 수 없음
    // Left => 1보다 왼쪽으로 갈 수 없음
    // Down => maximumLength보다 오른쪽으로 갈 수 없음
    operation.forEach { chr in
        switch chr {
        case "U":
            startPoint.0 = startPoint.0 - 1 > 0 ? startPoint.0 - 1 : 1
        case "D":
            startPoint.0 = startPoint.0 + 1 > maximumLength ? maximumLength : startPoint.0 + 1
        case "L":
            startPoint.1 = startPoint.1 - 1 > 0 ? startPoint.1 - 1 : 1
        case "R":
            startPoint.1 = startPoint.1 + 1 > maximumLength ? maximumLength : startPoint.1 + 1
        default:
            break
        }
    }

    // 결과 출력
    print("\(startPoint.0) \(startPoint.1)")
}

