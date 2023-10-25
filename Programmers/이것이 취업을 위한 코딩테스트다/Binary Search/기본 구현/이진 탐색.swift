//
//  이진 탐색.swift
//  Programmers
//
//  Created by 전민수 on 10/25/23.
//

import Foundation

func binarySearch(range: [Int], target: Int) -> Int? {
    var start = 0
    var end = range.count - 1

    while start <= end {
        let mid = (start + end) / 2

        if target == range[mid] {
            return mid
        } else if target < range[mid] {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }

    return nil
}
