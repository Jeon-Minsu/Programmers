//
//  체육복.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/30.
//

// MARK: - 문제 설명
//점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다. 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다. 예를 들어, 4번 학생은 3번 학생이나 5번 학생에게만 체육복을 빌려줄 수 있습니다. 체육복이 없으면 수업을 들을 수 없기 때문에 체육복을 적절히 빌려 최대한 많은 학생이 체육수업을 들어야 합니다.
//
//전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve가 매개변수로 주어질 때, 체육수업을 들을 수 있는 학생의 최댓값을 return 하도록 solution 함수를 작성해주세요.

// MARK: - 제한사항
//전체 학생의 수는 2명 이상 30명 이하입니다.
//체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
//여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
//여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
//여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.

// MARK: - 문제 해결

import Foundation

func countNumberOfStudentsWearingGymClothes(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var arr = Array(repeating: 1, count: n + 1)

    lost.forEach { arr[$0] = 0 }
    reserve.forEach { arr[$0] += 1 }

    for i in 1..<arr.count {
        guard arr[i] == 0 else {
            continue
        }

        if arr[i - 1] == 2 {
            arr[i - 1] = 1
            arr[i] = 1
        } else if i + 1 < arr.count, arr[i + 1] == 2 {
            arr[i + 1] = 1
            arr[i] = 1
        }
    }

    return n - arr.filter { $0 == 0 }.count
}

// MARK: - 본인이 생각하는 모범 답안

import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    let newReserve = reserve.filter { !lost.contains($0) }
    let newLost = lost.filter { !reserve.contains($0) }

    var lostPeople: Int = newLost.count

    newReserve.forEach {
        let isLend: Bool = newLost.contains($0 - 1) || newLost.contains($0 + 1)
        if isLend && lostPeople > 0 {
            lostPeople -= 1
        }
    }

    return n - lostPeople
}
