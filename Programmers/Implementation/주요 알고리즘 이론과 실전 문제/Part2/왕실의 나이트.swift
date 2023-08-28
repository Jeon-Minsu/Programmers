//
//  왕실의 나이트.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/28.
//

// MARK: - 문제 설명
// 왕실의 나이트(page115) 참고

// MARK: - 제한사항
// 왕실의 나이트(page115) 참고

// MARK: - 문제 해결

func calculateLPathCount() {
    // 나이트의 위치는 "a1"과 같이, "문자+숫자" 형태로 행과 열을 사용해 위치 표시
    // 행과 열을 구분하기 위한 입력 split
    let position = readLine()!.split(separator: "")

    // 문자를 숫자로 반환하기 위한 rowDictionary 생성
    let rowDictionary: [String.SubSequence: Int] = [
        "a": 1, "b": 2, "c": 3, "d": 4,
        "e": 5, "f": 6, "g": 7, "h": 8,
    ]

    // row 값을 dictionary을 통한 숫자 변환
    let row = rowDictionary[position[0]]!

    // column 값 추출
    let column = Int(position[1])!

    // LPath 경우의 수 카운팅을 위한 변수 추가
    var answer = 0

    // 이동 가능 경우의 수 배열 생성
    let allCases = [(-2, 1), (-2, -1), (-1, 2), (1, 2), (2, 1), (2, -1), (-1, -2), (1, -2)]

    // 행과 열 모두 1~8 사이에 위치할 때 이동 가능 경로이므로,
    // 이를 만족할 시, 정답 개수 + 1
    allCases.forEach { (x, y) in
        if 1...8 ~= (row + x) && 1...8 ~= (column + y) {
            answer += 1
        }
    }

    // 정답 출력
    print(answer)


    // 참고로, 알파벳을 숫자로 변환시 Dictionary 이외에도
    // unicodeScalars를 이용하여, a의 unicodeScalar를 기준으로
    // 목표 알파벳까지의 거리를 이용해 인덱스를 사용해도 된다
    //    print("a".unicodeScalars.first!.value) // 97
    //    print(UnicodeScalar("a").value) // 97
    //    print("e".unicodeScalars.first!.value) // 101
    //    print("e".unicodeScalars.first!.value - "a".unicodeScalars.first!.value) // 4
}
