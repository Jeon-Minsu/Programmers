//
//  최대공약수와 최소공배수.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환하는 함수, solution을 완성해 보세요. 배열의 맨 앞에 최대공약수, 그다음 최소공배수를 넣어 반환하면 됩니다. 예를 들어 두 수 3, 12의 최대공약수는 3, 최소공배수는 12이므로 solution(3, 12)는 [3, 12]를 반환해야 합니다.

// MARK: - 제한사항
// 두 수는 1이상 1000000이하의 자연수입니다.

// MARK: - 문제 해결

func GCDAndLCM(_ n:Int, _ m:Int) -> [Int] {
    let a = (1...n).filter { n % $0 == 0 }
    let b = (1...m).filter { m % $0 == 0 }

    let gcd = b.filter { a.contains($0) }.last!
    let lcm = n * m / gcd

    return [gcd, lcm]
}

// MARK: - 생각해 볼만한 답안

func solution(_ n:Int, _ m:Int) -> [Int] {
    let g = gcd(n,m)
    return [g, g * (n/g) * (m/g)]
}

func gcd(_ n:Int, _ m: Int) -> Int {
    return n % m == 0 ? m : gcd(m, n % m)
}
