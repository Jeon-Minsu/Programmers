//
//  제일 작은 수 제거하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/20.
//

// MARK: - 문제 설명
// 정수를 저장한 배열, arr 에서 가장 작은 수를 제거한 배열을 리턴하는 함수, solution을 완성해주세요. 단, 리턴하려는 배열이 빈 배열인 경우엔 배열에 -1을 채워 리턴하세요. 예를들어 arr이 [4,3,2,1]인 경우는 [4,3,2]를 리턴 하고, [10]면 [-1]을 리턴 합니다.

// MARK: - 제한사항
// arr은 길이 1 이상인 배열입니다.
// 인덱스 i, j에 대해 i ≠ j이면 arr[i] ≠ arr[j] 입니다.

// MARK: - 문제 해결

func eliminateMinNumber(_ arr:[Int]) -> [Int] {
    let minNumber = arr.min()
    var array = arr.filter { $0 != minNumber }

    return array == [] ? [-1] : array
}

// MARK: - 본인이 생각하는 모범 답안
// filter의 클로저 부분에 arr.min()을 사용하니 시간 초과 발생
// 시간복잡도가 복잡한 작업을 반복문과 같은 작업에 포함시키지 않기!
