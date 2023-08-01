//
//  로그인 성공?.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/09.
//

// MARK: - 문제 설명
// 머쓱이는 프로그래머스에 로그인하려고 합니다.
// 머쓱이가 입력한 아이디와 패스워드가 담긴 배열 id_pw와 회원들의 정보가 담긴 2차원 배열 db가 주어질 때,
// 다음과 같이 로그인 성공, 실패에 따른 메시지를 return하도록 solution 함수를 완성해주세요.
//
// 아이디와 비밀번호가 모두 일치하는 회원정보가 있으면 "login"을 return합니다.
// 로그인이 실패했을 때 아이디가 일치하는 회원이 없다면 “fail”를,
// 아이디는 일치하지만 비밀번호가 일치하는 회원이 없다면 “wrong pw”를 return 합니다.


// MARK: - 제한사항
// 회원들의 아이디는 문자열입니다.
// 회원들의 아이디는 알파벳 소문자와 숫자로만 이루어져 있습니다.
// 회원들의 패스워드는 숫자로 구성된 문자열입니다.
// 회원들의 비밀번호는 같을 수 있지만 아이디는 같을 수 없습니다.
// id_pw의 길이는 2입니다.
// id_pw와 db의 원소는 [아이디, 패스워드] 형태입니다.
// 1 ≤ 아이디의 길이 ≤ 15
// 1 ≤ 비밀번호의 길이 ≤ 6
// 1 ≤ db의 길이 ≤ 10
// db의 원소의 길이는 2입니다.

// MARK: - 문제 해결

import Foundation

func logIn(_ id_pw:[String], _ db:[[String]]) -> String {
    var dict: [String: String] = [:]

    db.forEach { dict[$0[0]] = $0[1] }

    guard dict.keys.contains(id_pw[0]) else {
        return "fail"
    }

    guard dict[id_pw[0]] == id_pw[1] else {
        return "wrong pw"
    }

    return "login"
}

// MARK: - 생각해 볼만한 답안

import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    return db.contains(id_pw)
        ? "login"
        : db.map{$0[0]}.contains(id_pw[0])
            ? "wrong pw"
            : "fail"
}
