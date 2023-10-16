//
//  삽입 정렬.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

// 데이터를 하나씩 확인하여 각 데이터를 적절한 위치에 삽입 정렬
// 선택 정렬에 비해 효율적
// 특정한 데이터가 적절한 위치에 들어가기 이전에, 그 앞까지의 데이터는 이미 정렬되어 있다고 가정
// 시간복잡도 O(N^2)
// 삽입 정렬은 현재 리스트의 데이터가 거의 정렬되어 있는 상태라면 매우 빠르게 동작
// 최선의 경우 O (N)의 시간 복잡도

import Foundation

func insertionSort(_ array: inout [Int]) {
    for i in 1..<array.count {
        let current = array[i]
        var j = i - 1

        while j >= 0 && array[j] > current {
            array[j + 1] = array[j]
            j -= 1
        }

        array[j + 1] = current
    }
}

//var numbers = [12, 11, 13, 5, 6]
//insertionSort(&numbers)
//print(numbers)

func insertionSort2(_ array: inout [Int]) {
    for stand in 1..<array.count {
        for index in stride(from: stand, to: 0, by: -1) {
            if array[index] < array[index - 1] {
                array.swapAt(index, index - 1)
            } else {
                break
            }
        }
    }
}

// 출처: https://babbab2.tistory.com/98
