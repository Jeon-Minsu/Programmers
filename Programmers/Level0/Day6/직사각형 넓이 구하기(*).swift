//
//  직사각형 넓이 구하기.swift
//  Programmers
//
//  Created by 전민수 on 2023/03/07.
//

// MARK: - 문제 설명
// 2차원 좌표 평면에 변이 축과 평행한 직사각형이 있습니다.
// 직사각형 네 꼭짓점의 좌표 [[x1, y1], [x2, y2], [x3, y3], [x4, y4]]가
// 담겨있는 배열 dots가 매개변수로 주어질 때, 직사각형의 넓이를 return 하도록 solution 함수를 완성해보세요.

// MARK: - 제한사항
// dots의 길이 = 4
// dots의 원소의 길이 = 2
// -256 < dots[i]의 원소 < 256
// 잘못된 입력은 주어지지 않습니다.

// MARK: - 문제 해결

import Foundation

func findAreaOfRectangle(_ dots: [[Int]]) -> Int {
//    let minPoint = dots.min { $0[0] <= $1[0] && $0[1] <= $1[1] }!
//    let maxPoint = dots.max { $0[0] <= $1[0] && $0[1] <= $1[1] }!

//    return (maxPoint[0] - minPoint[0]) * (maxPoint[1] - minPoint[1])

    let c = dots.sorted { a, b in
        return (a[0] <= b[0]) && (a[1] <= b[1])
    }

    return (c[3][0] - c[0][0]) * (c[3][1] - c[0][1])
}

// MARK: - 본인이 생각하는 모범 답안

func solution(_ dots:[[Int]]) -> Int {
    let dots = dots.sorted(by: { ($0[0], $0[1]) < ($1[0], $1[1]) })
    return (dots.last![0] - dots.first![0]) * (dots.last![1] - dots.first![1])
}
