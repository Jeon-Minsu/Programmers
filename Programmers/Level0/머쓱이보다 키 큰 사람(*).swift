//
//  머쓱이보다 키 큰 사람.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/28.
//

// MARK: - 문제 설명
// 머쓱이는 학교에서 키 순으로 줄을 설 때 몇 번째로 서야 하는지 궁금해졌습니다.
// 머쓱이네 반 친구들의 키가 담긴 정수 배열 array와 머쓱이의 키 height가 매개변수로 주어질 때,
// 머쓱이보다 키 큰 사람 수를 return 하도록 solution 함수를 완성해보세요.


// MARK: - 제한사항
// 1 ≤ array의 길이 ≤ 100
// 1 ≤ height ≤ 200
// 1 ≤ array의 원소 ≤ 200

// MARK: - 문제 해결

import Foundation

func getHeightRanking(_ array:[Int], _ height:Int) -> Int {
    var newArray = array
    newArray.append(height)

    let newArray2 = newArray.sorted(by: { $0 > $1 })

    return newArray2.firstIndex(of: height)!
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ array: [Int], _ height: Int) -> Int {
    array.filter { $0 > height }.count
}
