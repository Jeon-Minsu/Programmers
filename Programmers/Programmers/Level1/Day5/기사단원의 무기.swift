//
//  기사단원의 무기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/29.
//

// MARK: - 문제 설명
//숫자나라 기사단의 각 기사에게는 1번부터 number까지 번호가 지정되어 있습니다. 기사들은 무기점에서 무기를 구매하려고 합니다.
//
//각 기사는 자신의 기사 번호의 약수 개수에 해당하는 공격력을 가진 무기를 구매하려 합니다. 단, 이웃나라와의 협약에 의해 공격력의 제한수치를 정하고, 제한수치보다 큰 공격력을 가진 무기를 구매해야 하는 기사는 협약기관에서 정한 공격력을 가지는 무기를 구매해야 합니다.
//
//예를 들어, 15번으로 지정된 기사단원은 15의 약수가 1, 3, 5, 15로 4개 이므로, 공격력이 4인 무기를 구매합니다. 만약, 이웃나라와의 협약으로 정해진 공격력의 제한수치가 3이고 제한수치를 초과한 기사가 사용할 무기의 공격력이 2라면, 15번으로 지정된 기사단원은 무기점에서 공격력이 2인 무기를 구매합니다. 무기를 만들 때, 무기의 공격력 1당 1kg의 철이 필요합니다. 그래서 무기점에서 무기를 모두 만들기 위해 필요한 철의 무게를 미리 계산하려 합니다.
//
//기사단원의 수를 나타내는 정수 number와 이웃나라와 협약으로 정해진 공격력의 제한수치를 나타내는 정수 limit와 제한수치를 초과한 기사가 사용할 무기의 공격력을 나타내는 정수 power가 주어졌을 때, 무기점의 주인이 무기를 모두 만들기 위해 필요한 철의 무게를 return 하는 solution 함수를 완성하시오.

// MARK: - 제한사항
//1 ≤ number ≤ 100,000
//2 ≤ limit ≤ 100
//1 ≤ power ≤ limit

// MARK: - 문제 해결

import Foundation

func calculateNumberOfSteel(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    let array = Array(0...number)
    var countArray = Array(repeating: 0, count: number + 1)

    for i in 1...(array.count - 1) {
        for j in 1...((array.count - 1) / i) {
            countArray[i * j] += 1
        }
    }

    return countArray.map {
        $0 > limit ? power : $0
    }.reduce(0, +)
}

// MARK: - 생각해 볼만한 답안

import Foundation

func solution3(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var attack = [Int](repeating: 0, count: number + 1)

    for i in 1...number {
        var c = i

        while c <= number {
            attack[c] += 1
            c += i
        }
    }
    attack = attack.map { $0 > limit ? power : $0 }
    return attack.reduce(0, +)
}
