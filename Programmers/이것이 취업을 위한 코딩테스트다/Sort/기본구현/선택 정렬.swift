//
//  선택 정렬.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

// 가장 작은 데이터를 선택해 맨 앞에 있는 데이터와 바꾸고, 그다음 작은 데이터를 선택해 앞에서 두 번째 데이터와 바꾸는 과정을 반복
// 시간복잡도 O(N^2)
// 다른 정렬 알고리즘에 비해 매우 비효율적
// 다만, 특정한 리스트에서 가장 작은 데이터를 찾는 일이 코딩 테스트에서 잦으므로 숙지 필요

import Foundation

func selectionSort(_ array: inout [Int]) {
    // array의 전체에 이르기까지 loop
    for i in 0..<array.count {
        // 가장 작은값이 있는 인덱스
        var minIndex = i

        // 가장 작은 값을 앞으로 보내는 과정이니
        // 정렬된 값들 이후부터 가장 작은값을 찾아내기 위해 loop
        for j in (i + 1)..<array.count {
            if array[minIndex] > array[j] {
                minIndex = j
            }
        }

        // 현재 인덱스와 가장 작은값이 있는 인덱스 swap
        array.swapAt(i, minIndex)
    }
}

//var array = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]
//selectionSort(&array)
//print(array)
