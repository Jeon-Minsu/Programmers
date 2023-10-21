//
//  수박수박수박수박수박수?.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/21.
//

// MARK: - 문제 설명
// 길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요. 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.

// MARK: - 제한사항
// n은 길이 10,000이하인 자연수입니다.

// MARK: - 문제 해결

func repeatWatermelon(_ n:Int) -> String {
    return Array.init(repeating: "수", count: n).enumerated().map { $0.offset % 2 == 0 ? "수" : "박" }.joined()
}

// MARK: - 생각해 볼만한 답안

func solution(_ n: Int) -> String {
    return "\(String(repeating: "수박", count: n / 2))\(n % 2 == 0 ? "" : "수")"
}

func solution2(_ n:Int) -> String {
    return (0..<n).map{( $0 % 2 == 0 ? "수" : "박" )}.reduce("", +)
}
