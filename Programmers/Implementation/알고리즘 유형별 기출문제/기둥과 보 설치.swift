//
//  기둥과 보 설치.swift
//  Programmers
//
//  Created by 전민수 on 2023/09/07.
//

// MARK: - 문제 설명
//빙하가 깨지면서 스노우타운에 떠내려 온 "죠르디"는 인생 2막을 위해 주택 건축사업에 뛰어들기로 결심하였습니다. "죠르디"는 기둥과 보를 이용하여 벽면 구조물을 자동으로 세우는 로봇을 개발할 계획인데, 그에 앞서 로봇의 동작을 시뮬레이션 할 수 있는 프로그램을 만들고 있습니다.
//프로그램은 2차원 가상 벽면에 기둥과 보를 이용한 구조물을 설치할 수 있는데, 기둥과 보는 길이가 1인 선분으로 표현되며 다음과 같은 규칙을 가지고 있습니다.
//
//기둥은 바닥 위에 있거나 보의 한쪽 끝 부분 위에 있거나, 또는 다른 기둥 위에 있어야 합니다.
//보는 한쪽 끝 부분이 기둥 위에 있거나, 또는 양쪽 끝 부분이 다른 보와 동시에 연결되어 있어야 합니다.
//단, 바닥은 벽면의 맨 아래 지면을 말합니다.
//
//2차원 벽면은 n x n 크기 정사각 격자 형태이며, 각 격자는 1 x 1 크기입니다. 맨 처음 벽면은 비어있는 상태입니다. 기둥과 보는 격자선의 교차점에 걸치지 않고, 격자 칸의 각 변에 정확히 일치하도록 설치할 수 있습니다. 다음은 기둥과 보를 설치해 구조물을 만든 예시입니다.
//
//예를 들어, 위 그림은 다음 순서에 따라 구조물을 만들었습니다.
//
//(1, 0)에서 위쪽으로 기둥을 하나 설치 후, (1, 1)에서 오른쪽으로 보를 하나 만듭니다.
//(2, 1)에서 위쪽으로 기둥을 하나 설치 후, (2, 2)에서 오른쪽으로 보를 하나 만듭니다.
//(5, 0)에서 위쪽으로 기둥을 하나 설치 후, (5, 1)에서 위쪽으로 기둥을 하나 더 설치합니다.
//(4, 2)에서 오른쪽으로 보를 설치 후, (3, 2)에서 오른쪽으로 보를 설치합니다.
//만약 (4, 2)에서 오른쪽으로 보를 먼저 설치하지 않고, (3, 2)에서 오른쪽으로 보를 설치하려 한다면 2번 규칙에 맞지 않으므로 설치가 되지 않습니다. 기둥과 보를 삭제하는 기능도 있는데 기둥과 보를 삭제한 후에 남은 기둥과 보들 또한 위 규칙을 만족해야 합니다. 만약, 작업을 수행한 결과가 조건을 만족하지 않는다면 해당 작업은 무시됩니다.
//
//벽면의 크기 n, 기둥과 보를 설치하거나 삭제하는 작업이 순서대로 담긴 2차원 배열 build_frame이 매개변수로 주어질 때, 모든 명령어를 수행한 후 구조물의 상태를 return 하도록 solution 함수를 완성해주세요.

// MARK: - 제한사항
//n은 5 이상 100 이하인 자연수입니다.
//build_frame의 세로(행) 길이는 1 이상 1,000 이하입니다.
//build_frame의 가로(열) 길이는 4입니다.
//build_frame의 원소는 [x, y, a, b]형태입니다.
//x, y는 기둥, 보를 설치 또는 삭제할 교차점의 좌표이며, [가로 좌표, 세로 좌표] 형태입니다.
//a는 설치 또는 삭제할 구조물의 종류를 나타내며, 0은 기둥, 1은 보를 나타냅니다.
//b는 구조물을 설치할 지, 혹은 삭제할 지를 나타내며 0은 삭제, 1은 설치를 나타냅니다.
//벽면을 벗어나게 기둥, 보를 설치하는 경우는 없습니다.
//바닥에 보를 설치 하는 경우는 없습니다.
//구조물은 교차점 좌표를 기준으로 보는 오른쪽, 기둥은 위쪽 방향으로 설치 또는 삭제합니다.
//구조물이 겹치도록 설치하는 경우와, 없는 구조물을 삭제하는 경우는 입력으로 주어지지 않습니다.
//최종 구조물의 상태는 아래 규칙에 맞춰 return 해주세요.
//return 하는 배열은 가로(열) 길이가 3인 2차원 배열로, 각 구조물의 좌표를 담고있어야 합니다.
//return 하는 배열의 원소는 [x, y, a] 형식입니다.
//x, y는 기둥, 보의 교차점 좌표이며, [가로 좌표, 세로 좌표] 형태입니다.
//기둥, 보는 교차점 좌표를 기준으로 오른쪽, 또는 위쪽 방향으로 설치되어 있음을 나타냅니다.
//a는 구조물의 종류를 나타내며, 0은 기둥, 1은 보를 나타냅니다.
//return 하는 배열은 x좌표 기준으로 오름차순 정렬하며, x좌표가 같을 경우 y좌표 기준으로 오름차순 정렬해주세요.
//x, y좌표가 모두 같은 경우 기둥이 보보다 앞에 오면 됩니다.

// MARK: - 문제 해결

import Foundation

// 설치인지 삭제인지 구분하기 위한 enum
enum Action: Int {
    case uninstall = 0
    case install = 1
}

// 기둥인지 보인지 구분하기 위한 enum
enum Stuff: Int {
    case pillar = 0
    case beam = 1
}

// solution 함수
func installStructure(_ n: Int, _ build_frame: [[Int]]) -> [[Int]] {
    // 설치가능한 구조물을 담은 배열
    var answer: [[Int]] = []

    // 문제에 주어진 각각의 건축물에 대하여 반복문 실시
    for frame in build_frame {
        // 설치와 삭제 중, 어떤 작업인지 판단하기 위한 상수
        let action = frame.last
        // 현재 다루고자 하는 건축물의 [x 좌표, y 좌표, 건축물 종류] 정보를 다루는 배열
        // x, y, stuff 에 대하여 상수를 만들 수 있지만
        // 각각 frame[0], frame[1], frame[2]로 인덱싱이 필요해
        // 시간복잡도 면에서 dropLast는 O(1) 작업이고, 배열 초기화는 O(N) 정도일테니
        // O(N)을 3번 반복하는 것보다는 유리하다 판단
        let currentStuff = Array(frame.dropLast())

        // 설치 작업일 시
        if action == Action.install.rawValue {

            // 음영된 코드로 최초 실행하였으나
            // 불필요하게 다시 전체 구조물을 살펴보기때문에
            // 시간 초과 오류 발견
            // answer.append(currentStuff)
            //
            // if !canInstall(from: answer) {
            //     answer.removeLast()
            // }

            // x, y, stuff에 각각의 값을 대입
            // 이 경우에는 직접 값이 필요한 경우이니 어쩔수 없이 초기화
            let x = frame[0]
            let y = frame[1]
            let stuff = frame[2]

            // 기둥 설치 작업일시
            if stuff == Stuff.pillar.rawValue {
                // 기둥을 설치할 수 있는지 검사
                if canInstallPillar(x: x, y: y, in: answer) {
                    // 설치 가능시 정답 배열에 추가
                    answer.append(currentStuff)
                }
            // 기둥 설치 작업말고는 보 설치 작업뿐
            } else {
                // 보를 설치할 수 있는지 검사
                if canInstallBeam(x: x, y: y, in: answer) {
                    // 설치 가능시 정답 배열에 추가
                    answer.append(currentStuff)
                }
            }

        // 설치 작업말고는 삭제 작업뿐
        } else {
            // 먼저 현재 다루고자 하는 건축물을 제거
            let index = answer.firstIndex(of: currentStuff)!
            answer.remove(at: index)

            // 다음으로 해당 건축물을 제외하고도
            // 원래의 건축물을 지을 수 있는지 확인
            // 만약 불가능하다면
            if !canInstall(from: answer) {
                // 해당 작업을 취소하여야 함
                // 따라서 원래 위치에 해당 건축물을 다시 삽입
                // 여기서 본인은 순서 또한 건축에 지대한 영향을 미친다 판단하여 insert를 사용했으나
                answer.insert(currentStuff, at: index)

                // append로 해도 결국 같은 결과가 나옴
                // answer.append(currentStuff)
            }
        }
    }

    // 마지막으로 x 좌표 기준으로 오름차순 정렬하며
    // x 좌표가 같을 경우 y 좌표 기준으로 오름차순 정렬
    // x, y 좌표가 모두 같은 경우 기둥이 보보다 앞에 오도록 정렬
    // 해당 sorted 분기를 꼭 기억하여 다음에도 써먹자!
    return answer.sorted {
        if $0[0] != $1[0] {
            return $0[0] < $1[0]
        } else if $0[1] != $1[1] {
            return $0[1] < $1[1]
        } else {
            return $0[2] < $1[2]
        }
    }
}

// 입력받은 건축물을 모두 건축할 수 있는지 판단하는 함수
private func canInstall(from currentStructure: [[Int]]) -> Bool {
    // 모든 건축물을 건축 가능한지 확인하기 위한 반복문 실행
    for frame in currentStructure {
        // x, y, stuff 값 할당
        let x = frame[0]
        let y = frame[1]
        let stuff = frame[2]

        // 기둥 설치 작업일시
        if stuff == Stuff.pillar.rawValue {
            // 설치 가능 유무 확인
            if canInstallPillar(x: x, y: y, in: currentStructure) {
                // 설치 가능시 반복문이 계속되도록 continue
                continue
            } else {
                // 설치 불가능시 더 볼것도 없으니 false 반환
                return false
            }
        // 남은 작업은 보 설치 작업뿐
        } else {
            // 설치 가능 유무 확인
            if canInstallBeam(x: x, y: y, in: currentStructure) {
                // 설치 가능시 반복문이 계속되도록 continue
                continue
            } else {
                // 설치 불가능시 더 볼것도 없으니 false 반환
                return false
            }
        }
    }

    // 모두 continue 일때
    // 즉, 모든 건축물을 건축 가능할 시
    // true 값 반환
    return true

}

// 기둥 설치 가능 유무를 판단하는 함수
private func canInstallPillar(x: Int, y: Int, in currentStructure: [[Int]]) -> Bool {
    // y 좌표 값이 0일때 설치 가능
    if y == 0 {
        return true
    }

    // 기둥이 보의 한쪽 끝부분 위에 있으면 설치 가능
    if currentStructure.contains([x, y, 1]) || currentStructure.contains([x - 1, y, 1]) {
        return true
    }

    // 기둥이 다른 기둥 위에 있는 경우 설치 가능
    if currentStructure.contains([x, y - 1, 0]) {
        return true
    }

    // 이외의 경우는 모두 설치 불가
    return false
}

// 보 설치 가능 유무를 판단하는 함수
private func canInstallBeam(x: Int, y: Int, in currentStructure: [[Int]]) -> Bool {
    // 보는 한쪽 끝부분이 기둥 위에 있으면 설치 가능
    if currentStructure.contains([x, y - 1, 0]) || currentStructure.contains([x + 1, y - 1, 0]) {
        return true
    }

    // 보의 양쪽 끝부분이 다른 보와 동시에 연결되어 있으면 설치 가능
    if currentStructure.contains([x - 1, y, 1]) && currentStructure.contains([x + 1, y, 1]) {
        return true
    }

    // 이외의 경우는 모두 설치 불가
    return false
}
