//
//  부품 찾기.swift
//  Programmers
//
//  Created by 전민수 on 10/25/23.
//

// MARK: - 문제 설명
// 부품 찾기(page197) 참고

// MARK: - 제한사항
// 부품 찾기(page197) 참고

// MARK: - 문제 해결

import Foundation

func findPart() {
    // 가게의 전체 부품 개수
    let _ = Int(readLine()!)!
    // 가게의 전체 부품
    // 이진 탐색을 위하여 오름차순 정렬
    let store = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
    // 고객이 찾고자하는 부품 개수
    let _ = Int(readLine()!)!
    // 고객이 찾고자하는 부품
    let customer = readLine()!.components(separatedBy: " ").map { Int($0)! }

    // 이진탐색 메서드
    // 전체 범위와 타겟 숫자를 입력받아
    // 포함되어 있으면 "yes", 그렇지 않으면 "no" 반환
    func binarySearch(range: [Int], target: Int) -> String {
        // 시작 인덱스
        var start = 0
        // 마지막 인덱스
        var end = range.count - 1

        // 시작 인덱스와 마지막 인덱스가 엇갈리면 반복문종료
        while start <= end {
            // 이진 탐색은 반으로 나눠 검색하니
            // 중앙값인 mid
            let mid = (start + end) / 2

            // 타겟 숫자와 중앙 값에 있는 숫자가 일치하면 "yes"
            if target == range[mid] {
                return "yes"
            // 타겟 숫자가 중앙 값에 있는 숫자보다 작으면
            // 중앙값 포함 그 뒤에 있는 숫자는 보지 않아도 되므로
            // 마지막 인덱스를 현재 중앙값 이전 인덱스로 이동
            } else if target < range[mid] {
                end = mid - 1
            // 같은 맥락으로 타겟 숫자가 중앙 값에 있는 숫자보다 크면
            // 시작인덱스를 현재 중앙값 인덱스로 이동
            } else {
                start = mid + 1
            }
        }

        // 시작 인덱스와 마지막 인덱스가 엇갈려 반복문이 종료되었다면
        // 타겟 숫자를 찾지 못한것이니 "no" 출력
        return "no"
    }

    // 고객이 찾고자하는 부품이 있는지 여부를
    // map을 통해 binarySearch를 돌려서 바꿈
    let answer = customer.map {
        binarySearch(range: store, target: $0)
    }

    // 결과를 스페이싱 한번으로 출력
    answer.forEach {
        print($0, terminator: " ")
    }
}
