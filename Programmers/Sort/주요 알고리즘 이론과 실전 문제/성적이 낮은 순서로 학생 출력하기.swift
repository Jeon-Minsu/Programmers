//
//  성적이 낮은 순서로 학생 출력하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

import Foundation

func sortStudentsByScoreAscending() {
    // 주어지는 학생 정보의 수
    let number = Int(readLine()!)!
    // 학생의 이름과 점수를 담을 배열
    var array: [(String, Int)] = []

    // 주어지는 학생 정보의 수 만큼 반복
    for _ in 0..<number {
        // 학생 정보를 입력받아, name, score로 각각 정의
        let input = readLine()!.components(separatedBy: " ")
        let name = input[0]
        let score = Int(input[1])!

        // 배열에 tuple 형식으로 추가
        array.append((name, score))
    }

    // 학생의 점수에 따라 오름차순 정렬
    array.sort { $0.1 < $1.1 }

    // 한 칸씩 spacing 되도록 하며 이름만 출력
    array.forEach {
        print($0.0, terminator: " ")
    }
}
