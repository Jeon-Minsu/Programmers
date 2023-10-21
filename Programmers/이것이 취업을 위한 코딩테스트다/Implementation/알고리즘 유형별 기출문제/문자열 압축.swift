//
//  문자열 압축.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/19.
//

// MARK: - 문제 설명
//데이터 처리 전문가가 되고 싶은 "어피치"는 문자열을 압축하는 방법에 대해 공부를 하고 있습니다. 최근에 대량의 데이터 처리를 위한 간단한 비손실 압축 방법에 대해 공부를 하고 있는데, 문자열에서 같은 값이 연속해서 나타나는 것을 그 문자의 개수와 반복되는 값으로 표현하여 더 짧은 문자열로 줄여서 표현하는 알고리즘을 공부하고 있습니다.
//간단한 예로 "aabbaccc"의 경우 "2a2ba3c"(문자가 반복되지 않아 한번만 나타난 경우 1은 생략함)와 같이 표현할 수 있는데, 이러한 방식은 반복되는 문자가 적은 경우 압축률이 낮다는 단점이 있습니다. 예를 들면, "abcabcdede"와 같은 문자열은 전혀 압축되지 않습니다. "어피치"는 이러한 단점을 해결하기 위해 문자열을 1개 이상의 단위로 잘라서 압축하여 더 짧은 문자열로 표현할 수 있는지 방법을 찾아보려고 합니다.
//
//예를 들어, "ababcdcdababcdcd"의 경우 문자를 1개 단위로 자르면 전혀 압축되지 않지만, 2개 단위로 잘라서 압축한다면 "2ab2cd2ab2cd"로 표현할 수 있습니다. 다른 방법으로 8개 단위로 잘라서 압축한다면 "2ababcdcd"로 표현할 수 있으며, 이때가 가장 짧게 압축하여 표현할 수 있는 방법입니다.
//
//다른 예로, "abcabcdede"와 같은 경우, 문자를 2개 단위로 잘라서 압축하면 "abcabc2de"가 되지만, 3개 단위로 자른다면 "2abcdede"가 되어 3개 단위가 가장 짧은 압축 방법이 됩니다. 이때 3개 단위로 자르고 마지막에 남는 문자열은 그대로 붙여주면 됩니다.
//
//압축할 문자열 s가 매개변수로 주어질 때, 위에 설명한 방법으로 1개 이상 단위로 문자열을 잘라 압축하여 표현한 문자열 중 가장 짧은 것의 길이를 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//s의 길이는 1 이상 1,000 이하입니다.
//s는 알파벳 소문자로만 이루어져 있습니다.
//입출력 예
//s    result
//"aabbaccc"    7
//"ababcdcdababcdcd"    9
//"abcabcdede"    8
//"abcabcabcabcdededededede"    14
//"xababcdcdababcdcd"    17
//입출력 예에 대한 설명
//입출력 예 #1
//
//문자열을 1개 단위로 잘라 압축했을 때 가장 짧습니다.
//
//입출력 예 #2
//
//문자열을 8개 단위로 잘라 압축했을 때 가장 짧습니다.
//
//입출력 예 #3
//
//문자열을 3개 단위로 잘라 압축했을 때 가장 짧습니다.
//
//입출력 예 #4
//
//문자열을 2개 단위로 자르면 "abcabcabcabc6de" 가 됩니다.
//문자열을 3개 단위로 자르면 "4abcdededededede" 가 됩니다.
//문자열을 4개 단위로 자르면 "abcabcabcabc3dede" 가 됩니다.
//문자열을 6개 단위로 자를 경우 "2abcabc2dedede"가 되며, 이때의 길이가 14로 가장 짧습니다.
//
//입출력 예 #5
//
//문자열은 제일 앞부터 정해진 길이만큼 잘라야 합니다.
//따라서 주어진 문자열을 x / ababcdcd / ababcdcd 로 자르는 것은 불가능 합니다.
//이 경우 어떻게 문자열을 잘라도 압축되지 않으므로 가장 짧은 길이는 17이 됩니다.

// MARK: - 문제 해결

import Foundation

func compressString(_ s: String) -> Int {
    // 압축된 문자열의 최소 길이
    // 초기값은 압축안된 문자열 길이 그대로 입력
    var minCount = s.count
    // 문자열을 나누고자 하는 단위의 수
    var unit = 1

    // 문자열을 나누는 단위를 총 문자열의 길이의 반보다 커지면
    // 반복문이 종료되도록
    // 반을 초과하면 어차피 문자열이 반복될 수 없기 때문
    while unit <= (s.count / 2) {
        // 압축된 문자열
        var compressedString = ""
        // 이전 문자열 값
        var previousString: String?
        // 문자열 반복 횟수
        var repeatCount = 1
        // 단위에 따라 나누어진 문자열 배열
        let totalString = split(s, by: unit)

        // 문자열 배열 반복
        for subString in totalString {
            // 앞서 알아본 압축 문자열 최소 길이보다
            // 현재 문자열 길이가 길다면 early break
            if compressedString.count >= minCount {
                break
            }

            // 이전 문자열 값이 있는 상태이면
            // 이는 문자열 배열 첫번째 값이 아닌 두번째 값부터 해당
            if let previous = previousString {
                // 만일 현재 문자열과 이전 문자열이 같으면
                // 반복된 횟수 +1
                if subString == previous {
                    repeatCount += 1
                } else {
                    // 그렇지 않으면, 문자열이 서로 다른 경우 의미
                    // 만일 반복횟수가 1보다 크면
                    // 이전 반복횟수 먼저 압축 문자열에 추가
                    if repeatCount > 1 {
                        compressedString += String(repeatCount)
                    }

                    // 그리고 이전 문자열을 압축 문자열에 추가
                    compressedString += previousString!
                    // 이제 다음으로 비교할 문자열로 현재의 문자열을 입력
                    previousString = subString
                    // 반복 횟수 초기화
                    repeatCount = 1
                }
            } else {
                // 문자열 배열 첫번째 값일때 해당 코드로 빠짐
                // 다음으로 비교할 문자열로 현재의 문자열을 입력
                previousString = subString
            }
        }

        // 부분 문자열의 마지막 값은 들어가지 않았으므로
        // 반복횟수가 1보다 크면 반복횟수도 고려하고
        if repeatCount > 1 {
            compressedString += String(repeatCount)
        }

        // 마지막 부분 문자열까지 압축 문자열에 추가
        compressedString += previousString!
        // 문자열 나누는 단위 +1
        unit += 1
        // 현재 압축 문자열의 길이와
        // 이전 최소 문자열 길이 비교하여
        // minCount 업데이트
        minCount = min(compressedString.count, minCount)
    }

    // 압축 문자열 최소 길이 반환
    return minCount
}

// 단위에 따라 문자열을 나누는 메서드
private func split(_ s: String, by unit: Int) -> [String] {
    // 부분 문자열을 담을 배열
    var result: [String] = []

    // 시작 인덱스부터 마지막 인덱스까지 사용자 입력 단위의 보폭으로 반복
    for i in stride(from: 0, to: s.count, by: unit) {
        // 시작 인덱스는 반복문이 돌때마다
        // 사용자 입력 단위의 보폭만큼 뒤로 이동
        let startIndex = s.index(s.startIndex, offsetBy: i)
        // 마지막 인덱스 또한 마찬가지로
        // startIndex가 업데이트 되는 만큼 뒤로 이동
        // limitedBy를 s.endIndex로 설정
        // 만일 마지막 인덱스를 초과하는 인덱스를 범위로 하면 nil 값이 반환되므로
        // nil coalescing을 통해 s.endIndex 대입
        let endIndex = s.index(startIndex, offsetBy: unit, limitedBy: s.endIndex) ?? s.endIndex
        // 부분문자열을 추출하기 위한 범위 인덱싱
        let chunk = s[startIndex..<endIndex]

        // 부분 문자열을 반환할 배열에 추가
        result.append(String(chunk))
    }

    // 부분 문자열 배열 반환
    return result
}
