//
//  치킨 쿠폰.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 프로그래머스 치킨은 치킨을 시켜먹으면 한 마리당 쿠폰을 한 장 발급합니다.
// 쿠폰을 열 장 모으면 치킨을 한 마리 서비스로 받을 수 있고, 서비스 치킨에도 쿠폰이 발급됩니다.
// 시켜먹은 치킨의 수 chicken이 매개변수로 주어질 때 받을 수 있는 최대 서비스 치킨의 수를 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// chicken은 정수입니다.
// 0 ≤ chicken ≤ 1,000,000

// MARK: - 문제 해결

import Foundation

func orderChicken(_ chicken: Int) -> Int {
//    var number = chicken * 1000
//    var service = number
//
//    while (number / 10) > 0 {
//        print("service= \(service)")
//        print("number = \(number)")
//        number /= 10
//        service += number
//    }
//
//    return Int(service / 10000)

    var number = chicken * 1000
    var service = number

    while (number / 10) > 0 {
        print("service= \(service)")
        print("number = \(number)")
        number /= 10

        service += number
    }

    return Int(service / 10000)
}

// MARK: - 본인이 생각하는 모범 답안

func solution7(_ chicken:Int) -> Int {
    var chicken = chicken
    var service = 0
    var coupon = 0

    while chicken != 0 {
        coupon += chicken
        service += coupon / 10
        chicken = coupon / 10
        coupon %= 10
    }

    return service
}

func solution8(_ chicken:Int) -> Int {
    var c = chicken
    var s = 0

    while c >= 10 {
        s += c/10
        c = c/10+c%10
    }
    return s
}
