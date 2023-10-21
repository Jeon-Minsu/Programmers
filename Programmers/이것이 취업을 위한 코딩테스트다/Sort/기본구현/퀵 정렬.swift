//
//  퀵 정렬.swift
//  Programmers
//
//  Created by 전민수 on 2023/10/16.
//

// 기준(pivot)을 설정하고 그 기준보다 큰 수와 작은 수를 교환한 후
// 리스트를 반으로 나누는 방식으로 동작
// 평균 시간 복잡도 O(NlogN)으로 빠른편
// 최악의 경우는 시간복잡도 O(N^2)
// 데이터 무작위 입력시 퀵 정렬은 빠르게 동작할 확률이 높으나
// 이미 데이터가 정렬되어 있는 경우에는 매우 느리게 동작
// 삽입정렬과 반대

import Foundation

// array: 배열, start: 시작 인덱스, end: 종료 인덱스
func quickSort(_ array: inout [Int], start: Int, end: Int) {
    // 시작 인덱스가 종료 인덱스보다 크거나 같다면,
    // 배열의 크기가 1 이하이므로 아무 작업을 하지 않고 함수를 반환
    // 재귀적으로 사용될 quickSort를 끝내기 위한 종료 구문
    if start >= end {
        return
    }

    // pivot은 기준점
    // left는 왼쪽에서부터 피벗의 오른쪽 방향으로 탐색하기 위한 인덱스
    // right는 오른쪽에서부터 피벗의 왼쪽 방향으로 탐색하기 위한 인덱스
    let pivot = start
    var left = start + 1
    var right = end

    // left와 right가 서로 교차할대까지 실행
    // 피벗을 기준으로 왼쪽에는 작은 값, 오른쪽에는 큰 값을 정렬하기 위한 루프
    while left <= right {
        // left가 end 인덱스를 초과하지 않는 선까지
        // pivot보다 큰 값이 나오지 않으면
        // left를 1씩 증가시킴
        while left <= end && array[left] <= array[pivot] {
            left += 1
        }
        // right가 start 인덱스보다 작아지지 않는 선까지
        // pivot보다 작은 값이 나오지 않으면
        // right를 1씩 감소시킴
        while right > start && array[right] >= array[pivot] {
            right -= 1
        }

        // left가 right보다 크면
        // 서로 엇갈리게 지날 때이니
        // 교차 검사가 끝날 때로
        // 작은 값인 right와 pivot의 위치를 swap
        // 이때 pivot은 본인이 있어야 할 위치에 들어가게 됨

        // else의 경우는
        // 정상적인 pivot 기준 교환하는 시기이므로
        // swap
        if left > right {
            array.swapAt(right, pivot)
        } else {
            array.swapAt(left, right)
        }
    }

    // right는 pivot이었던 값이 정상적으로 들어간 위치이므로
    // 이를 기준으로 좌우로 퀵 정렬 재귀 호출
    quickSort(&array, start: start, end: right - 1)
    quickSort(&array, start: right + 1, end: end)
}

//var array = [5, 7, 9, 0, 3, 1, 6, 2, 4, 8]
//quickSort(&array, start: 0, end: array.count - 1)
//print(array)

func quickSort2(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else { return array }

    let pivot = first
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }

    return quickSort2(left) + [pivot] + quickSort2(right)
}

// 출처: https://babbab2.tistory.com/101
