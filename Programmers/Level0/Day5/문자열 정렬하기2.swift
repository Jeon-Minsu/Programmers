//
//  문자열 정렬하기2.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/06.
//

// MARK: - 문제 설명
// 영어 대소문자로 이루어진 문자열 my_string이 매개변수로 주어질 때,
// my_string을 모두 소문자로 바꾸고 알파벳 순서대로 정렬한 문자열을 return 하도록 solution 함수를 완성해보세요

// MARK: - 제한사항
// 0 < my_string 길이 < 100

// MARK: - 문제 해결

import Foundation

func alignString2(_ my_string:String) -> String {
    return my_string.lowercased().sorted().map( {String($0)} ).joined()
}
