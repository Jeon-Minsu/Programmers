//
//  위에서 아래로.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

import Foundation

func descendingOrder() {
    // 주어지는 수의 개수
    let number = Int(readLine()!)!
    // 수를 담을 배열
    var array = [Int]()

    // 주어지는 수의 개수만큼 반복
    for _ in 0..<number {
        // 숫자를 입력받음
        let num = Int(readLine()!)!
        // 배열에 추가
        array.append(num)
    }

    // 내림차순 정렬
    array.sort(by: >)

    // 한 칸씩 spacing 되도록 출력
    array.forEach {
        print($0, terminator: " ")
    }
}
