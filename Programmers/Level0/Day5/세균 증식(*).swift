//
//  세균 증식.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 어떤 세균은 1시간에 두배만큼 증식한다고 합니다.
// 처음 세균의 마리수 n과 경과한 시간 t가 매개변수로 주어질 때 t시간 후 세균의 수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 0 ≤ n ≤ 1,000,000

// MARK: - 문제 해결

import Foundation

func multiplyBacteria(_ n:Int, _ t:Int) -> Int {
    return n * Int(pow(2, t).description)!
}

// MARK: - 본인이 생각하는 모범 답안

func solution3(_ n:Int, _ t:Int) -> Int {
    n * Int(pow(Float(2), Float(t)))
}

func solution4(_ n: Int, _ t: Int) -> Int {
    var answer = n

    for _ in 0..<t {
        answer += answer
    }
    
    return answer
}
