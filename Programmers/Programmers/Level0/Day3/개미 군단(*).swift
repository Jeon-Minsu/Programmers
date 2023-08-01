//
//  개미 군단.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/02.
//

// MARK: - 문제 설명
// 개미 군단이 사냥을 나가려고 합니다.
// 개미군단은 사냥감의 체력에 딱 맞는 병력을 데리고 나가려고 합니다.
// 장군개미는 5의 공격력을, 병정개미는 3의 공격력을 일개미는 1의 공격력을 가지고 있습니다.
// 예를 들어 체력 23의 여치를 사냥하려고 할 때, 일개미 23마리를 데리고 가도 되지만,
// 장군개미 네 마리와 병정개미 한 마리를 데리고 간다면 더 적은 병력으로 사냥할 수 있습니다.
// 사냥감의 체력 hp가 매개변수로 주어질 때, 사냥감의 체력에 딱 맞게 최소한의 병력을 구성하려면
// 몇 마리의 개미가 필요한지를 return하도록 solution 함수를 완성해주세요.


// MARK: - 제한사항
// hp는 자연수입니다.
// 0 ≤ hp ≤ 1000

// MARK: - 문제 해결

import Foundation

func organizerAntCorps(_ hp: Int) -> Int {
    let general = hp / 5
    let soldier = (hp - 5 * general) / 3
    let worker = hp - 5 * general - 3 * soldier

    return general + soldier + worker
}

// MARK: - 본인이 생각하는 모범 답안

func solution2(_ hp:Int) -> Int {
    var hp = hp
    var result = 0
    for i in [5, 3, 1] {
        result += hp / i
        hp %= i
    }
    return result
}

func solution3(_ hp:Int) -> Int {
    let tempInt = hp % 5
    return hp / 5 + tempInt / 3 + tempInt % 3
}
