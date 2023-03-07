# Programmers
프로그래머스 코딩테스트 연습 repo

# Level 0
## Day1
### 기억할 내용
- stride(from:to:by:)
  - for문을 역순, 특정 간격으로 진행함에 유용
  - stride(from:through:by:)와 차이로, to는 범위 비포함, through는 포함
- 삼항 연산자의 연속적인 사용 가능
  - ex) return angle < 90 ? 1 : angle == 90 ? 2 : angle < 180 ? 3 : 4
- 배열내 최빈값 사용은 Dictionary 사용이 적절하다 판단
  - key를 통해 해당 값을, value를 통해 count를 저장
- 특정 필터링이 들어간 일정한 간격의 배열을 만들고 싶다면 (start...num).filter 사용
  - (start...num)의 타입은 (ClosedRange<Int>)
  - filter 함수를 통해 Array를 반환하는 원리

## Day2
### 기억할 내용
- 단방향 범위 연산자
    - n 이하: ...n
    - n 이상: n...
    - n 미만: ..<n
- 문자열(String) 역순 정렬
    - String("문자열".reversed())
- 문자열 반복
    - String(repeating:count:)
- 배열 내 특정 범위 지정
    - array[startIndex...EndIndex]
- 배열 오름차순, 내림차순 정렬
    - 오름차순
        - array.sorted()
        - array.sorted(by: <)
    - 내림차순
        - numbers.sorted(by: >)
- switch 문 내 tuple 범위 case
    ```swift
    switch (element1, element2) {
        case (0..., 0...): 
            return 1
        case (...0, 0...): 
            return 2
        case (...0, ...0): 
            return 3
        case (0..., ...0): 
            return 4
        default: 
            return 0
    }
    ```
    
## Day3
### 기억할 내용
- String의 경우 split 불필요
    - map을 통해서 이미 character 하나로 분리
- Int 범위 유념
    - 30!의 경우 Int 범위를 넘어가기 때문에, Double, Decimal... 등 변경 필요
- 이중 배열의 경우 미리 repeating을 통해 요소를 채우는 것도 좋은 방법
    - 추가로, 배열의 경우 .indices롤 통해 sequence 호출 가능

## Day4
### 기억할 내용
    - 배열 내 특정 요소 제거
        - components(separatedBy:)
            - ex) array.components(separatedBy: ["a", "e", "i", "o", "u"])
        - filter & contains
            - ex) array.filter { !["a", "e", "i", "o", "u"].contains($0)}
    - 문자열 내 숫자 확인
        - Int 형변환
        - isNumber 메서드 사용

## Day5
### 기억할 내용
    - 직전의 값과 연관된 행동의 경우 Stack 적용한지 생각해보기
        - array.popLast() 등을 통해 직전값 제거 가능
    - 배열 내 최소값을 찾을때 min(by:) 사용하기
        - 시퀀스의 최소값을 반환
        - 시간 복잡도: O(n) {n = 시퀀스의 길이}
    - 배수를 찾는 과정에서 % 을 이용할때 0(zero) 유념
        - 0은 항상 나머지가 0 이므로 배수를 이용할 때 주의 
        - contains를 이용하는 것도 방법
    - 시퀀스 내 일정 간격 떨어진 요소를 호출할 때 
        - stride(from:to:by) 활용 가능
    - 문자열(String) 치환
        - replacingOccurrences(of:with:)
            - 음의 부호 치환시 "--" 의 경우, "+" 로 바꾸는 것 잊지 말기 
    - **문자열(String)을 글자 하나하나로 나누기**
        - ArraySlice(my_String)
    - 배열 내 요소 인덱스 바꾸기
        - array.swapAt(_:_:)
    - Dictionary를 통한 element 카운팅
        - reduce(into:_:) 사용
        - ex) my_String.reduce(into: [:]) { dict, chr in
                dict[chr, default: 0] += 1
            }
    - Array -> Dictionary 치환
        - Dictionary(grouping:)
    - 제곱, 제곱근 관련 함수
        - 제곱 -> pow(_:_:)
            - 파라미터로 Float, Decimal이 올 수 있음
            - Decimal 사용시 값 추출 방법
                - description
                - Int(truncating: NSDecimalNumber(decimal: num))
        - 제곱근 -> sqrt(_:)
    - 제곱수 판별
        - sqrt(Double(num)) == floor(sqrt(Double(num)))
            - 제곱수라면 제곱근의 값이 소수점 이하가 없기 때문에 위의 식 가능
}

## Day6
### 기억할 내용
    - 튜플 비교 연산자
        - 튜플의 비교는 왼쪽에서 오른쪽 방향으로 이뤄짐
        - 이는 왼쪽에서 비교가 끝나면 더이상 오른쪽까지 가서 비교 X 의미
            - ex) (1, "zebra") < (2, "apple") => True 
                - 1이 2와 같지 않기 때문에 이 시점에 튜플의 비교 종료
            - ex) (3, "apple") < (3, "bird") => True
                - 비교하는 수가 3으로 같기 때문에, 문자도 비교
    - switch case 구문 내 조건 축약
        - where 절을 사용하여 조건 추가 가능
            - ex) case "up" where y < (board[1] / 2):
