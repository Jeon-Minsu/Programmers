//
//  회의실 배정.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/23.
//

// MARK: - 문제 설명
// 한 개의 회의실이 있는데 이를 사용하고자 하는 N개의 회의에 대하여 회의실 사용표를 만들려고 한다.
// 각 회의 I에 대해 시작시간과 끝나는 시간이 주어져 있고, 각 회의가 겹치지 않게 하면서 회의실을 사용할 수 있는 회의의 최대 개수를 찾아보자.
// 단, 회의는 한번 시작하면 중간에 중단될 수 없으며 한 회의가 끝나는 것과 동시에 다음 회의가 시작될 수 있다.
// 회의의 시작시간과 끝나는 시간이 같을 수도 있다. 이 경우에는 시작하자마자 끝나는 것으로 생각하면 된다.

// MARK: - 제한사항
// 첫째 줄에 회의의 수 N(1 ≤ N ≤ 100,000)이 주어진다.
// 둘째 줄부터 N+1 줄까지 각 회의의 정보가 주어지는데 이것은 공백을 사이에 두고 회의의 시작시간과 끝나는 시간이 주어진다.
// 시작 시간과 끝나는 시간은 2^31-1보다 작거나 같은 자연수 또는 0이다.

// MARK: - 문제 해결

import Foundation

func numberOfMeetingRoom() {
    // numberOfMeetingRoom: 총 회의의 수
    let numberOfMeetingRoom = Int(readLine()!)!
    // array: 각각의 회의를 담은 [[Int]] 배열 생성
    var array: [[Int]] = []

    // 각각의 회의를 배열에 넣어 정리
    for _ in 0..<numberOfMeetingRoom {
        let time = readLine()!.components(separatedBy: " ").map { Int($0)! }
        array.append(time)
    }

    // 배열을 역순으로 정렬
    // 역순으로 정렬한 이유는 이후 removeLast를 사용하여 시간복잡도면에서 이득을 보기 위함
    // 역순 정렬전 로직은 다음과 같음
    // 먼저, 앞의 회의를 currentNumber, 뒤의 회의를 nextNumber라고 명명할때
    // currentNumber의 시작시간이 nextNumber의 시작시간보다 이르게 시작하도록 오름차순 정렬
    // 만일, 두 회의의 시작시간이 같으면, 회의시간이 짧은 회의를 선택하는 것이 유리함
    // 따라서, 종료시간이 더 짧은 회의가 앞쪽으로 배치되도록 로직 설정
    // 마지막으로 "!"를 활용하여 이를 역순으로 배치
    array.sort { currentNumber, nextNumber in
        !((currentNumber[0] < nextNumber[0]) || (currentNumber[0] == nextNumber[0] && currentNumber[1] < nextNumber[1]))
    }

    // 정답 배열이 담길 [[Int]] 배열 생성
    var answerArray: [[Int]] = []

    // 모든 회의를 다룰때까지 반복문
    while !array.isEmpty {
        // 아직 answerArray가 비어있다면, 비교불가능이니 일단 그냥 넣기
        if answerArray.isEmpty {
            answerArray.append(array.removeLast())
        } else {
            // 정답 배열의 가장 마지막 요소를 previousNumber로,
            // 배열에서 현재 뺀 요소를 currentNumber로 명명
            let previousNumber = answerArray.last!
            let currentNumber = array.removeLast()

            // 만약 previousNumber의 종료시간이 currentNumber의 시작시간보다 작거나 같으면
            // 그대로 정답배열에 넣으면 됨
            // 이미 사용자 정의 정렬이 된 상태이기에
            // previousNumber의 시작시간과 종료시간 사이의 회의가 올 수가 없음을 보장
            if previousNumber[1] <= currentNumber[0] {
                answerArray.append(currentNumber)
            } else if previousNumber[1] > currentNumber[1] {
                // 만일, previousNumber의 종료시간이 currentNumber의 종료시간보다 큰 경우는
                // currentNumber가 더 짧은 회의시간을 지불하므로
                // 더 많은 회의를 담기 위해서 이전의 정답배열에 있던 previousNumber를 제거하고
                // 현재 currentNumber를 정답배열에 넣는것이 타당
                answerArray.removeLast()
                answerArray.append(currentNumber)
            } else {
                // 위의 두 경우에도 포함되지 않으면 현재 정답배열 그대로 가는 것이 유리하단 의미이니
                // 다음 숫자로 넘어가는 것이 적절
                continue
            }
        }
    }

    // 정답 배열의 count는 곧, 회의의 최대 개수를 의미
    print(answerArray.count)
}
