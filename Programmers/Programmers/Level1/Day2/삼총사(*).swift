//
//  삼총사.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 한국중학교에 다니는 학생들은 각자 정수 번호를 갖고 있습니다. 이 학교 학생 3명의 정수 번호를 더했을 때 0이 되면 3명의 학생은 삼총사라고 합니다. 예를 들어, 5명의 학생이 있고, 각각의 정수 번호가 순서대로 -2, 3, 0, 2, -5일 때, 첫 번째, 세 번째, 네 번째 학생의 정수 번호를 더하면 0이므로 세 학생은 삼총사입니다. 또한, 두 번째, 네 번째, 다섯 번째 학생의 정수 번호를 더해도 0이므로 세 학생도 삼총사입니다. 따라서 이 경우 한국중학교에서는 두 가지 방법으로 삼총사를 만들 수 있습니다.
//
// 한국중학교 학생들의 번호를 나타내는 정수 배열 number가 매개변수로 주어질 때, 학생들 중 삼총사를 만들 수 있는 방법의 수를 return 하도록 solution 함수를 완성하세요.

// MARK: - 제한사항
// 3 ≤ number의 길이 ≤ 13
// -1,000 ≤ number의 각 원소 ≤ 1,000
//. 서로 다른 학생의 정수 번호가 같을 수 있습니다.

// MARK: - 문제 해결

import Foundation

func nominateTrio(_ number:[Int]) -> Int {
    var answer = [[Int]]()
    var arr1 = number

    while arr1.count > 0 {
        let i = arr1.removeFirst()
        var arr2 = arr1

        while arr2.count > 0 {
            let j = arr2.removeFirst()
            var arr3 = arr2

            while arr3.count > 0 {
                let k = arr3.removeFirst()

                if i + j + k == 0 {
                    answer.append([i, j, k])
                }
            }
        }
    }

    return answer.count
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution6(_ number:[Int]) -> Int {
    var ans = 0

    for i in 0..<number.count {
        for j in i+1..<number.count {
            for z in j+1..<number.count {
                print(i,j,z)
                if number[i] + number[j] + number[z] == 0 { ans += 1 }
            }
        }
    }

    return ans
}
