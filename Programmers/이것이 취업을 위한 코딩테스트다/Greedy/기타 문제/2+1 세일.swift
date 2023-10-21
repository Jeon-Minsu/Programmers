//
//  2+1 세일.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/24.
//

// MARK: - 문제 설명
// KSG 편의점에서는 과일우유, 드링킹요구르트 등의 유제품을 '2+1 세일'하는 행사를 하고 있습니다. KSG 편의점에서 유제품 3개를 한 번에 산다면 그중에서 가장 싼 것은 무료로 지불하고 나머지 두 개의 제품 가격만 지불하면 됩니다. 한 번에 3개의 유제품을 사지 않는다면 할인 없이 정가를 지불해야 합니다.
// 예를 들어, 7개의 유제품이 있어서 각 제품의 가격이 10, 9, 4, 2, 6, 4, 3이고 재현이가 (10, 3, 2), (4, 6, 4), (9)로 총 3번에 걸쳐서 물건을 산다면 첫 번째 꾸러미에서는 13원을, 두 번째 꾸러미에서는 10원을, 세 번째 꾸러미에서는 9원을 지불해야 합니다.
// 재현이는 KSG 편의점에서 친구들과 같이 먹을 총 N팩의 유제품을 구입하려고 합니다. 재현이를 도와 최소비용으로 유제품을 구입할 수 있도록 도와주세요!

// MARK: - 제한사항
//첫 번째 줄에는 유제품의 수 N (1 ≤ N ≤ 100,000)이 주어집니다.
//두 번째 줄부터 N개의 줄에는 각 유제품의 가격 Ci (1 ≤ Ci ≤ 100,000)가 주어집니다.

// MARK: - 문제 해결

func calculateMinimumCostOfDairyProducts() {
    // 유제품 구입에 최소비용을 쓰기 위해서는
    // 2+1의 무료가 되는 유제품의 가격이 높을수록 좋음을 깨달았음
    // 따라서 제품을 비용순으로 내림차순으로 정렬하여
    // 3의 배수에 해당하는 인덱스에 있는 제품을 제거하는 것이 옳다고 판단

    // numberOfProducts: 문제에서 주어지는 유제품의 수
    let numberOfProducts = Int(readLine()!)!

    // 정렬을 사용하기 위한 배열 생성 및 요소 삽입 process
    var array: [Int] = []

    for _ in 0..<numberOfProducts {
        let product = Int(readLine()!)!
        array.append(product)
    }

    // 내림차순 정렬
    array.sort(by: >)

    // index값을 활용하기 위한 enumerated() 메서드 사용
    // enumerated()는 시간복잡도 O(1)
    let answerArray = array.enumerated()
    // 3의 배수에 있는 값들은 무료로 구매가 되므로
    // index값(enumerated에선 offset)을 3으로 나누었을때 2가 아닌 값이면 더하고
    // 2일 경우에는 무료이니 0을 더하도록 로직 설정
    let answer = answerArray.reduce(0) { partialResult, currentNumber in
        return partialResult + (currentNumber.offset % 3 != 2 ? currentNumber.element : 0)
    }

    // 최소 비용 출력
    print(answer)
}

