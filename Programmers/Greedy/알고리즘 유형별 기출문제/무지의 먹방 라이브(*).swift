//
//  무지의 먹방 라이브.swift
//  Programmers
//
//  Created by 전민수 on 2023/08/09.
//

// MARK: - 문제 설명
//* 효율성 테스트에 부분 점수가 있는 문제입니다.
//평소 식욕이 왕성한 무지는 자신의 재능을 뽐내고 싶어 졌고 고민 끝에 카카오 TV 라이브로 방송을 하기로 마음먹었다.
//그냥 먹방을 하면 다른 방송과 차별성이 없기 때문에 무지는 아래와 같이 독특한 방식을 생각해냈다.
//
//회전판에 먹어야 할 N 개의 음식이 있다.
//각 음식에는 1부터 N 까지 번호가 붙어있으며, 각 음식을 섭취하는데 일정 시간이 소요된다.
//무지는 다음과 같은 방법으로 음식을 섭취한다.
//
//무지는 1번 음식부터 먹기 시작하며, 회전판은 번호가 증가하는 순서대로 음식을 무지 앞으로 가져다 놓는다.
//마지막 번호의 음식을 섭취한 후에는 회전판에 의해 다시 1번 음식이 무지 앞으로 온다.
//무지는 음식 하나를 1초 동안 섭취한 후 남은 음식은 그대로 두고, 다음 음식을 섭취한다.
//다음 음식이란, 아직 남은 음식 중 다음으로 섭취해야 할 가장 가까운 번호의 음식을 말한다.
//회전판이 다음 음식을 무지 앞으로 가져오는데 걸리는 시간은 없다고 가정한다.
//무지가 먹방을 시작한 지 K 초 후에 네트워크 장애로 인해 방송이 잠시 중단되었다.
//무지는 네트워크 정상화 후 다시 방송을 이어갈 때, 몇 번 음식부터 섭취해야 하는지를 알고자 한다.
//각 음식을 모두 먹는데 필요한 시간이 담겨있는 배열 food_times, 네트워크 장애가 발생한 시간 K 초가 매개변수로 주어질 때 몇 번 음식부터 다시 섭취하면 되는지 return 하도록 solution 함수를 완성하라.

// MARK: - 제한사항
// food_times는 각 음식을 모두 먹는 데 필요한 시간이 음식의 번호 순서대로 들어 있는 배열입니다.
// k는 방송이 중단된 시간을 나타냅니다.
// 만약 더 섭취해야 할 음식이 없다면 -1을 반환하면 됩니다.
// 정확성 테스트 제한 사항
    // food_times 의 길이는 1 이상 2,000 이하이다.
    // food_times 의 원소는 1 이상 1,000 이하의 자연수이다.
    // k는 1 이상 2,000,000 이하의 자연수이다.
// 효율성 테스트 제한 사항
    // food_times 의 길이는 1 이상 200,000 이하이다.
    // food_times 의 원소는 1 이상 100,000,000 이하의 자연수이다.
    // k는 1 이상 2 x 10^13 이하의 자연수이다.

// MARK: - 문제 해결

import Foundation

func startFoodLiveOfMuzi(_ food_times: [Int], _ k: Int64) -> Int {
    // 주어진 전체 시간
    var totalTime = Int(k)

    // 주어진 음식 배열(food_times)을 (인덱스, 필요섭취시간) 튜플 형식으로 map
    var array = food_times.enumerated().map { ($0.offset + 1, $0.element) }

    // 총 섭취 비용이 동일한 경우를 판단하기 위하여 dictionary 활용하기로 결정
    // array -> dictionary 변환 작업
    var dict: [Int: Int] = [:]
    array.forEach { index, number in
        // 총 섭취 비용을 key 값으로 활용
        // 총 섭취 비용이 동일한 값이 있다면 해당 key의 value에 1을 더함
        // 그렇지 아니할 경우 신규 등록이니 value를 1로 초기화
        if let existingValue = dict[number] {
            dict[number] = existingValue + 1
        } else {
            dict[number] = 1
        }
    }

    // 총 섭취 비용이 작은 순으로 dictionary를 오름차순 정렬이 이루어진 배열로 초기화
    let sortedDictionary = dict.sorted(by: <)

    // 모든 요소가 한번 도는 횟수를 round로 가정
    // 직전 라운드를 의미하는 previousRound
    var previousRound = 0
    // 현재 라운드를 의미하는 currentRound
    var currentRound = 0
    // 직전 라운드를 통해 소진된 배열 요소 개수를 의미하는 lastCount
    var lastCount = 0

    // sortedDictionary의 크기만큼 반복문 실행
    for index in sortedDictionary.indices {
        // currentRound를 sortedDictionary[index].key로 초기화
        // 이렇게 초기화를 하면 각 index에 해당하는 총 섭취 비용을 불필요하게 반복문을 돌지 않고 생략 가능
        // 예시로 sortedDicionary[0].key = 4인 경우,
        // 원래대로라면 해당 음식(sortedDicionary[0])을 모두 섭취하기까지 전체 배열을 4번 돌아야 하지만
        // 4번 돌았다 가정하고 모든 음식에 4의 시간을 빼주면 동일한 효과를 더욱 유리하게 점할 수 있음
        currentRound = sortedDictionary[index].key
        // diff는 현재 라운드와 직전 라운드의 차(difference)로 얼마만큼 round를 돌았는지를 판단하는 척도
        let diff = currentRound - previousRound

        // 이번 반복을 통해 돈 diff만큼의 round에서
        // array.count는 전체 배열의 길이, 즉 round의 길이에 해당
        // lastCount는 직전 라운드를 통해 소진된 배열 요소의 개수
        // 따라서 (array.count - lastCount)는 이번 라운드에 존재하는 배열 요소의 개수를 의미
        // totalTime은 주어진 남은 시간이기에
        // (diff * (array.count - lastCount))가 totalTime보다 작다면
        // 해당 라운드를 온전히 돌 수 있는 것이니 if문의 true case로 넘어가기
        if diff * (array.count - lastCount) <= totalTime {
            // 주어진 전체 시간(totalTime)에서
            // 현재 라운드에서 소진된 섭취 시간(diff * (array.count - lastCount))을 뺌
            totalTime -= diff * (array.count - lastCount)
            // currentRound에 대한 처리를 완료했으니,
            // previousRound를 currentRound로 업데이트
            previousRound = currentRound
            // 현재 소진된 배열 요소의 갯수(sortedDictionary[index].value)를 lastCount에 더함
            lastCount += sortedDictionary[index].value
        } else {
            // else 케이스에 빠졌다는 것은
            // 이번에 라운드를 온전히 돌기에는 주어진 시간이 부족함을 의미
            // 즉, 더이상 round 단위로 한번에 뺄 수 없고
            // 남은 시간만큼 직접 인덱스에 접근해야함
            break
        }
    }

    // 나머지 주어진 시간을 소비하기 위하여
    // 일단 배열을 섭취한 음식이 있는 요소를 모두 제거한 배열로 업데이트
    // previousRound는 결국 한 음식에 몇 초를 할애했는가이니
    // 각 요소에 최종 previousRound를 뺀 값이 0보다 큰
    // 즉, 더 섭취할 수 있는 음식만 남도록 배열을 최신화
    // 주의점은 sortedDictionary랑 array는 다름
    // array는 index와 섭취 비용을 튜플로 정리한 배열이고
    // sortedDictionary는 전체 라운드를 효과적으로 제거하기 위해
    // 섭취 비용별로 dictionary 타입으로 재정렬했던 배열이었음
    array = array.filter({
        $0.1 - previousRound > 0
    })

    // 만약 배열이 비었다면
    if array.isEmpty {
        return -1
    } else {
        // 이제 남은 시간(totalTime)을 배열의 나머지 요소 내에서 인덱싱을 돌려야함
        // 나머지 요소에서 얼마나 돌든 결국 마지막 멈추는 지점이 중요하니
        // totalTime % array.count로 나머지 값을 추출
        // 배열의 해당 인덱스에 접근한 다음, (index, 섭취비용) 튜플 형태이니
        // 우리가 필요한 인덱스를 추출하기 위해 .0을 return
        return array[totalTime % array.count].0
    }
}

// MARK: - 본인이 생각하는 모범 답안
