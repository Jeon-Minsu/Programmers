//
//  소인수분해.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/03.
//

// MARK: - 문제 설명
// 소인수분해란 어떤 수를 소수들의 곱으로 표현하는 것입니다.
// 예를 들어 12를 소인수 분해하면 2 * 2 * 3 으로 나타낼 수 있습니다.
// 따라서 12의 소인수는 2와 3입니다.
// 자연수 n이 매개변수로 주어질 때
// n의 소인수를 오름차순으로 담은 배열을 return하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
// 1 ≤ my_string의 길이 ≤ 1,000
// my_string은 소문자, 대문자 그리고 한자리 자연수로만 구성되어있습니다.

// MARK: - 문제 해결

import Foundation

func factorizationIntoPrime(_ n: Int) -> [Int] {
    return (2...n)
        .filter { n % $0 == 0 }
        .filter { num in
            return (2...num).filter { num % $0 == 0}.count == 1
        }
}
