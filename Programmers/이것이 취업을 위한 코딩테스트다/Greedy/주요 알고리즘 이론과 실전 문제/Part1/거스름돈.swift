//
//  거스름돈.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/01.
//

// MARK: - 문제 설명
// 타로는 자주 JOI잡화점에서 물건을 산다. JOI잡화점에는 잔돈으로 500엔, 100엔, 50엔, 10엔, 5엔, 1엔이 충분히 있고, 언제나 거스름돈 개수가 가장 적게 잔돈을 준다. 타로가 JOI잡화점에서 물건을 사고 카운터에서 1000엔 지폐를 한장 냈을 때, 받을 잔돈에 포함된 잔돈의 개수를 구하는 프로그램을 작성하시오.

// MARK: - 제한사항
// 입력은 한줄로 이루어져있고, 타로가 지불할 돈(1 이상 1000미만의 정수) 1개가 쓰여져있다.

// MARK: - 문제 해결

import Foundation

func returnCountOfCoinsForChanges() {
    let money = Int(readLine()!)!
    var change = 1000 - money
    var count = 0

    while change / 500 > 0 {
        change -= 500
        count += 1
    }

    while change / 100 > 0 {
        change -= 100
        count += 1
    }

    while change / 50 > 0 {
        change -= 50
        count += 1
    }

    while change / 10 > 0 {
        change -= 10
        count += 1
    }

    while change / 5 > 0 {
        change -= 5
        count += 1
    }

    while change / 1 > 0 {
        change -= 1
        count += 1
    }

    print(count)
}

// MARK: - 본인이 생각하는 모범 답안

func returnCountOfCoinsForChanges2() {
    var money = 1000 - Int(readLine()!)!
    var count = 0

    let coinTypes = [500, 100, 50, 10, 5, 1]

    for coin in coinTypes {
        count += money / coin
        money %= coin
    }

    print(count)
}
