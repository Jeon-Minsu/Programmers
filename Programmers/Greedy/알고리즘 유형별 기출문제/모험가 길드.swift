//
//  모험가 길드.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/09.
//

// MARK: - 문제 설명
// 모험가 길드(page312) 참고

// MARK: - 제한사항
// 모험가 길드(page312) 참고

// MARK: - 문제 해결

import Foundation

func createGuildOfAdventurers() -> Int {
    let numberOfMembers = Int(readLine()!)!
    let members = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: <)
    var remainedMembers: [Int] = []
    var count = 0
    
    for i in 0..<numberOfMembers {
        let fear = members[i]
        remainedMembers.append(fear)
        
        if fear == remainedMembers.count {
            remainedMembers.removeAll()
            count += 1
        }
    }

    return count
}

// MARK: - 본인이 생각하는 모범 답안
