//
//  A로 B 만들기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 문자열 before와 after가 매개변수로 주어질 때,
// before의 순서를 바꾸어 after를 만들 수 있으면 1을, 만들 수 없으면 0을 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// 0 < before의 길이 == after의 길이 < 1,000
// before와 after는 모두 소문자로 이루어져 있습니다.

// MARK: - 문제 해결

import Foundation

func transform(_ before:String, _ after:String) -> Int {
    var beforeArray = before

    after.forEach { chr in
        if beforeArray.contains(chr) {
            if let index = beforeArray.firstIndex(of: chr) {
                beforeArray.remove(at: index)
            }
        }
    }

    return beforeArray.count == 0 ? 1 : 0
}


// MARK: - 본인이 생각하는 모범 답안

func solution(_ before: String, _ after: String) -> Int {
    Array(before).sorted() == Array(after).sorted() ? 1 : 0
}
