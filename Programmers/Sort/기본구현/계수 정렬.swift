//
//  계수 정렬.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

// 계수는 count를 의미
// 즉, 모든 범위를 담을 수 있는 크기의 리스트를 선언하여
// 각각 알맞은 범위에 해당 값을 count하여 정렬
//
// 특정한 조건이 부합할 때만 사용할 수 있지만 매우 빠른 정렬 알고리즘
// 특정한 조건: 데이터의 크기 범위가 제한 되어 정수 형태로 표현할 수 있을 때
// 음의 정수, 부동 소수점 값은 인덱싱, 배열 크기, 데이터 순서 측면에서 부적합
//
// 모든 데이터가 양의 정수인 상황에서 데이터의 개수를 N, 데이터 중 최대값의 크기 를 K라고 할 때, 계수 정렬의 시간 복잡도는 O(N + K)
// 앞에서부터 데이터를 하 나씩 확인하면서 리스트에서 적절한 인덱스의 값을 1씩 증가 -> O(N)
// 추후에 리스트의 각 인덱스에 해당하는 값들을 확인할 때 데이터 중 최댓값의 크기만큼 반복을 수행 -> O(K)
//
// 공간 복잡도는 때때로 비효율성 초래, 동일한 값을 가지는 데이터가 여러 개 등장할 대 효율적
// 반례: 데이터가 0과 999,999, 단 2개만 존재 -> 리스트의 크기가 100만 개가 되도록 선언
//
// 총평: 계수 정렬은 데이터의 크기가 한정되어 있고, 데이터의 크기가 많이 중복되어 있을수록 유리하며 항상 사용할 수는 X

import Foundation

func countingSort(_ array: inout [Int]) {
    // 최대값의 수만큼 배열을 선언해야 하므로 최대값 구하기
    // maxElement + 1에서 1을 더함은 0 부터 인덱스를 세기때문
    let maxElement = array.max() ?? 0
    var countingArray = [Int](repeating: 0, count: maxElement + 1)

    // 배열에서 해당 값을 counting
    for element in array {
        countingArray[element] += 1
    }

    // 출력배열
    var outputArray = [Int]()

    // 인덱스가 곧 값을 의미하므로, 개수만큼 배열에 추가
    for (index, count) in countingArray.enumerated() {
        for _ in 0..<count {
            outputArray.append(index)
        }
    }

    array = outputArray
}

//var numbers = [4, 2, 2, 8, 3, 3, 1]
//countingSort(&numbers)
//print(numbers)
