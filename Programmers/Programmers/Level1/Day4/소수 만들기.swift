//
//  소수 만들기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/24.
//

// MARK: - 문제 설명
//주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//nums에 들어있는 숫자의 개수는 3개 이상 50개 이하입니다.
//nums의 각 원소는 1 이상 1,000 이하의 자연수이며, 중복된 숫자가 들어있지 않습니다.

// MARK: - 문제 해결

import Foundation

func makePrimeNumber(_ nums:[Int]) -> Int {
    var count = 0

    let numberArray = nums.sorted()
    let max = numberArray[(numberArray.count - 3)...].reduce(0, +)
    var boolArray = Array(repeating: true, count: max + 1)

    boolArray[0] = false
    boolArray[1] = false

    for i in 2..<boolArray.count {
        if boolArray[i] {
            for j in 1...(boolArray.count / i) {
                if i * j != i && (i * j) < boolArray.count {
                    boolArray[i * j] = false
                }
            }
        }
    }

    for a in 0..<numberArray.count {
        for b in (a + 1)..<numberArray.count {
            for c in (b + 1)..<numberArray.count {
                if boolArray[numberArray[a] + numberArray[b] + numberArray[c]] {
                    count += 1
                }
            }
        }
    }

    return count
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution7(_ nums:[Int]) -> Int {
    func isPrime(_ num: Int) -> Bool {
        var n = 2
        while n < num {
            if num % n == 0 { return false }
            n += 1
        }
        return true
    }

    var answer = 0

    for i in 0 ..< nums.count - 2 {
        for j in i + 1 ..< nums.count - 1 {
            for k in j + 1 ..< nums.count {
                if isPrime(nums[i] + nums[j] + nums[k]) { answer += 1 }
            }
        }
    }
    return answer
}
