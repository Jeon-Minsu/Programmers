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
