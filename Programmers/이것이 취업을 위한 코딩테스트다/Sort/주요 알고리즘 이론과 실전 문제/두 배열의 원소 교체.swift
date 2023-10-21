//
//  두 배열의 원소 교체.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

import Foundation

func swapArrays() {
    // 문제의 조건: 원소의 개수(N)와 최대 교환가능 개수(K)
    let condition = readLine()!.components(separatedBy: " ").map { Int($0)! }
    // 합의 최대값을 구하기 위한 배열
    // 가장 작은 값을 B 배열에 버려야하니,
    // 오름차순으로 정렬
    var arrayA = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: <)
    // 교환할 수를 가진 배열
    // 가장 높은 값을 A 배열에 주어야하니,
    // 내림차순으로 정렬
    var arrayB = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: >)
    // 최대 교환가능 개수
    let maxSwaps = condition[1]

    // 최대 교환가능 개수만큼 반복
    for i in 0..<maxSwaps {
        // A 배열에서 해당 인덱스의 값이
        // B 배열의 값보다 작으면 swap
        if arrayA[i] < arrayB[i] {
            swap(&arrayA[i], &arrayB[i])
        } else {
            // 그렇지 않은 경우
            // 어차피 크기에 따라 정렬되어 있으니
            // 더이상 반복해봤자 무의미
            // 따라서, early break
            break
        }
    }

    // A 배열의 합 출력
    print(arrayA.reduce(0, +))
}
