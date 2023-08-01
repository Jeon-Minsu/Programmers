//
//  옷가게 할인 받기.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 머쓱이네 옷가게는 10만 원 이상 사면 5%, 30만 원 이상 사면 10%,
// 50만 원 이상 사면 20%를 할인해줍니다.
// 구매한 옷의 가격 price가 주어질 때,
// 지불해야 할 금액을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 10 ≤ price ≤ 1,000,000
// price는 10원 단위로(1의 자리가 0) 주어집니다.
// 소수점 이하를 버린 정수를 return합니다.

// MARK: - 문제 해결

import Foundation

func discount(_ price:Int) -> Int {
    switch price {
    case 100000..<300000:
        return Int(Double(price) * 0.95)
    case 300000..<500000:
        return Int(Double(price) * 0.9)
    case 500000...1000000:
        return Int(Double(price) * 0.8)
    default:
        return price
    }
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ price:Int) -> Int {
    switch price {
    case 100000..<300000:
        return Int(Double(price) * 0.95)
    case 300000..<500000:
        return Int(Double(price) * 0.90)
    case 500000...:
        return Int(Double(price) * 0.80)
    default:
        return price
    }
}
