//
//  럭키 스트레이트.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/31.
//

// MARK: - 문제
// 럭키 스트레이트(page321) 참고

// MARK: - 제한사항
// 럭키 스트레이트(page321) 참고

// MARK: - 문제 해결

func luckyStraightPunch() {
    // input값은 띄어쓰기 없이 한 번에 입력받으나,
    // 각각 하나의 요소로 다루어야 함
    // 이에 split을 쓴다음 Int 변환을 해주었으나,
    // 백준에서는 공백 없이 문자열을 분리하려고 한다면,
    // 문자열을 단일 문자로 분리하기 때문에 제대로 작동 X
    // let input = readLine()!.split(separator: "").map { Int($0)! }
    // 이에, Array함수를 사용해, 먼저 배열화를 하고 map 하는 방식 채택
    let input = Array(readLine()!).map { Int(String($0))! }
    // 중간 기준이되는 인덱스
    let half = input.count / 2
    // 좌측 숫자의 합
    let left = input[..<half].reduce(0, +)
    // 우측 숫자의 합
    let right = input[half...].reduce(0, +)

    // 럭키 스트레이트 가능성 여부 출력
    print(left == right ? "LUCKY" : "READY")
}
