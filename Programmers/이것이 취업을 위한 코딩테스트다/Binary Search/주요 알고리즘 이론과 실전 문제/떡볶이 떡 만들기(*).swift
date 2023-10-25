//
//  떡볶이 떡 만들기.swift
//  Programmers
//
//  Created by 전민수 on 10/25/23.
//

// MARK: - 문제 설명
// 떡볶이 떡 만들기(page201) 참고

// MARK: - 제한사항
// 떡볶이 떡 만들기(page201) 참고

// MARK: - 문제 해결

import Foundation

func prepareRiceCake() {
    // 떡의 개수와 손님이 요청한 떡의 길이 입력
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    // 손님이 요청한 떡의 길이
    let requestedLength = input[1]
    // 개별 높이를 가진 떡의 배열
    let arrayOfRiceCake = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

    // 이진탐색 메서드
    func binarySearch(range: [Int], target: Int) -> Int {
        // 시작 인덱스
        var start = 0
        // 마지막 인덱스
        var end = range.count - 1
        // 반복문이 터지기 전 마지막 중앙값
        var theLastMid = Int.max

        // 시작인덱스와 마지막 인덱스가 충돌하지 않으면 반복
        while start <= end {
            // 중앙값의 인덱스
            let mid = (start + end) / 2
            // 중앙값
            let numOfMid = range[mid]
            // 마지막 중앙값 초기화
            theLastMid = mid

            // 중앙값부터 마지막 값까지, 중앙값만큼을 뺀 값들의 합
            let length = range[mid...].reduce(0) { partialResult, num in
                return partialResult + num - numOfMid
            }

            // 타겟값과 절단한 떡의 길의 총합이 일치하면 반환
            if target == length {
                return range[mid]
                // 타겟값보다 떡의 길이가 길다면
                // 타겟으로 삼을 떡을 더 줄일 수 있으므로
                // 중앙값의 인덱스 다음으로 시작 인덱스 조정
            } else if target < length {
                start = mid + 1
                // 같은 맥락으로, 타겟값보다 떡의 길이가 짧다면
                // 떡을 더 취해야하므로, 마지막 인덱스를 중앙값의 전으로 이동시켜
                // 중앙값이 더 앞으로 가도록 조정
            } else {
                end = mid - 1
            }
        }

        // 반복문을 돌려도 원하는 값이 안 나올때
        // 일단 마지막 중앙값을 기준으로 길이를 계산
        var minusNum = range[theLastMid]
        var length = range[theLastMid...].reduce(0) { partialResult, num in
            return partialResult + num - minusNum
        }

        // 만약 길이가 타겟값보다 크면, 인덱스를 좀 더 뒤로 옮겨도 되므로 아래의 반복문 활용
        if length > target {
            while length > target {
                theLastMid += 1
                minusNum = range[theLastMid]
                length = range[theLastMid...].reduce(0) { partialResult, num in
                    return partialResult + num - minusNum
                }
            }
        }

        // 만약 길이가 타겟값보다 작으면
        // 떡을 남길 길이를 점점 늘리면 됨
        while target > length {
            minusNum -= 1

            length = range[theLastMid...].reduce(0) { partialResult, num in
                return partialResult + num - minusNum
            }
        }

        return minusNum
    }

    // 이진 탐색 메서드 실행 후 결과 출력
    let answer = binarySearch(range: arrayOfRiceCake, target: requestedLength)
    print(answer)
}

// MARK: - 본인이 생각하는 모범 답안

func prepareRiceCake2() {
    // 상동
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let requestedLength = input[1]
    let arrayOfRiceCake = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

    var start = 0
    // 인덱스가 아닌 최대값
    var end = arrayOfRiceCake.max()!
    // 마지막 결과값(떡을 절단할 길이)
    var lastResult = 0

    while start <= end {
        // 절단한 떡의 총길이
        var total = 0
        // 해당 중앙값은 인덱스가 아닌 정말 값을 의미
        let mid = (start + end) / 2

        // 모든 떡의 배열을 돌면서,
        // 중앙값보다 크면, 그만큼 절단하여 total에 더함
        for element in arrayOfRiceCake {
            if element > mid {
                total += element - mid
            }
        }

        // 떡의 길이가 부족한 경우 더 많이 잘라야함
        // 왼쪽 부분 탐색
        if total < requestedLength {
            end = mid - 1
            // 떡의 양이 충분한 경우 덜 잘라야함
            // 오른쪽 부분 탐색
        } else {
            // 최대한 덜 잘랐을때가 정답이므로, 여기에서 lastResult 기록
            lastResult = mid
            start = mid + 1
        }
    }

    // 정답 출력
    print(lastResult)
}
