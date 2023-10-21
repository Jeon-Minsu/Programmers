//
//  2016년.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/23.
//

// MARK: - 문제 설명
//2016년 1월 1일은 금요일입니다. 2016년 a월 b일은 무슨 요일일까요? 두 수 a ,b를 입력받아 2016년 a월 b일이 무슨 요일인지 리턴하는 함수, solution을 완성하세요. 요일의 이름은 일요일부터 토요일까지 각각 SUN,MON,TUE,WED,THU,FRI,SAT
//
//입니다. 예를 들어 a=5, b=24라면 5월 24일은 화요일이므로 문자열 "TUE"를 반환하세요.

// MARK: - 제한사항
// 2016년은 윤년입니다.
// 2016년 a월 b일은 실제로 있는 날입니다. (13월 26일이나 2월 45일같은 날짜는 주어지지 않습니다)

// MARK: - 문제 해결

func returnDayIn2016(_ a:Int, _ b:Int) -> String {
    let answerArray = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"]
    let month = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let a = month[..<a].reduce(0, +)
    let b = a + b

    return answerArray[b % 7 == 0 ? 6 : b % 7 - 1]
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ a:Int, _ b:Int) -> String {

    let w = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let monthDay = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let totalDay = monthDay[0..<a-1].reduce(0, +) + b

    return w[totalDay % 7]
}

import Foundation

func solution2(_ a:Int, _ b:Int) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    let date = dateFormatterGet.date(from:"2016-\(a)-\(b)")
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat  = "EE"//"EE" to get short style
    return dateFormatter.string(from:date!).uppercased()
}
