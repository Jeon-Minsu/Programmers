# Programmers
프로그래머스 코딩테스트 연습 repo

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
