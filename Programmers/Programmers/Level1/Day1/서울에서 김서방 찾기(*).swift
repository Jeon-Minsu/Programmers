//
//  서울에서 김서방 찾기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// String형 배열 seoul의 element중 "Kim"의 위치 x를 찾아,
// "김서방은 x에 있다"는 String을 반환하는 함수, solution을 완성하세요.
// seoul에 "Kim"은 오직 한 번만 나타나며 잘못된 값이 입력되는 경우는 없습니다.

// MARK: - 제한사항
// seoul은 길이 1 이상, 1000 이하인 배열입니다.
// seoul의 원소는 길이 1 이상, 20 이하인 문자열입니다.
// "Kim"은 반드시 seoul 안에 포함되어 있습니다.

// MARK: - 문제 해결

func searchForMrKimIn(_ seoul:[String]) -> String {
    let index = seoul.enumerated().filter { $0.element == "Kim" }.first!.offset

    return "김서방은 \(index)에 있다"
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}
