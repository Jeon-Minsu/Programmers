//
//  소수 찾기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/23.
//

// MARK: - 문제 설명
//1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
//
//소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
//(1은 소수가 아닙니다.)

// MARK: - 제한사항
//n은 2이상 1000000이하의 자연수입니다.

// MARK: - 문제 해결

//168

func countPrimeNumberfromOneTo(_ n:Int) -> Int {
    var arr = Array(2...n)
    var count = 0

    while arr.count > 0 {
        if arr.first! > 1000 {
            count += arr.count
            arr = []
            break
        }

        let a = arr.removeFirst()
        count += 1

        arr = arr.filter { num in
            return num % a != 0
        }
    }

    return count
}

// MARK: - 본인이 생각하는 모범 답안

func solution10(_ n:Int) -> Int {
    var primes:[Bool] = [Bool](repeating: true, count: n + 1)
    var count = 0

    for i in 2...n {
        if primes[i] {
            count = count + 1
        }

        for j in 1...(n/i) {
            primes[i * j] = false
        }
    }

    return count
}
