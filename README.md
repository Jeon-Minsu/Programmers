# Programmers
프로그래머스 코딩테스트 연습 repo

# Level 0
## 수료 완료
![코딩테스트 입문 캘린더](https://user-images.githubusercontent.com/99063327/224464391-ddfac0b6-5dbe-42ae-bea4-aa91167aa334.png)

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

## Day7
### 기억할 내용
    - 배열 내 최소값을 찾을때 min(by:) 꼭 활용하기
    - 범위를 지정하고 일정 조건을 만족하는 배열 반환
        - ex) (1..<maxEdge).filter { minEdge + $0 > maxEdge }
            - 1부터 maxEdge 이하의 범위에서 (maxEdge - minEdge) 보다 큰 원소를 가지는 배열 반환
    - 포함 여부 확인을 위해 String 활용 가능
        - 특정 문자 포함 여부 확인을 위해 String, sorted(), contains, joined 활용해보기
            - ex) (탐색범위 배열).map { String($0.sorted()) }.contains((탐색 요소).sorted().joined())
    - 겹치는 선분의 길이는 꼭 다시 풀기
    - core dump 문제시 배열의 범위가 잘 잡혀있는지 확인
        - 일례로, 유한소수 찾기에서 범위를 그냥 약수 2로 잡다가 매개변수로 1이 들어올 수 있는 가능성 망각

## Day8
### 기억할 내용
    - 두 가지 정렬 조건 요구시, 튜플 고려
        - ex) 특정값 n과 가깝우면서, 큰 수부터 정렬
            - numlist.sorted(by: { (abs($0 - n), -$0) < (abs($1 - n), -$1) }
    - 야매) 나머지, 소수점으로 고생할 때, 걍 1000같이 큰 수 곱한 다음, 마지막에 다시 나눠주기
    - 이진수 표시 기억하기
        - Int(number, radix: 2)
        - String(number, radix:2)
    - 문자열 포함 여부시, sorted() 이후 같은지 비교하는 것도 좋은 방법

## Day9
### 기억할 내용
    - 제한사항을 잘 읽으면 함수를 더 쉽게 구현 가능
    - 나누기의 경우, 분모가 0이 안되게 조심
    - 연속된 수의 합
        - 목표값을 원소의 갯수로 나눈후 -1, +1 하기

# Level 1
## Day1
### 기억할 내용
- 시간 복잡도를 최대한 줄이는 방식으로 생각하기
    - 문제 ex) String(n).map { Int(String($0))! }.reduce(0, +)
    - 개선 ex) String(n).reduce(0, { $0 + Int(String($1))! })
        
- 일정한 간격의 배열 생성 방법
    - ex) Array(1...n).map { Int64($0 * spacing) }
- 정수 제곱근 간단 판별 방법
    - ex) n = 144 일 때,
        let t = Int64(sqrt(Double(n)))
        return t * t == n ? true : false
    - 제곱근 함수 => sqrt
    - 제곱 함수 => pow
- Character 배열의 경우 String() 함수를 통해 간단히 변환 가능
    - 문제 ex) Int64(String(n).sorted(by: >).map { String($0) }.joined())!
    - 개선 ex) Int64(String(String(n).sorted(by: >)))!
- 배열 내 원하는 요소의 인덱스 찾기
    - firstIndex(of:) 메서드 사용
- ** 배열 하위 시퀀스 반환 메서드
    - func prefix(_ maxLength: Int) -> Self.SubSequence
        - 배열의 앞에서부터 maxLength 만큼의 subSequence 반환
    - func suffix(_ maxLength: Int) -> Self.SubSequence
        - 배열의 뒤에서부터 maxLength 만큼의 subSequence 반환
- 두 개의 시퀀스 합치기
    - zip(_:_:)
        - 각 쌍(pair)의 요소가 sequence1 및 sequence2의 해당 요소인 튜플(tuple) 시퀀스 반환
- 시간복잡도가 복잡한 작업을 반복문과 같은 작업에 포함시키지 않기!
    - 문제 ex)
        var array = arr.filter { $0 != arr.min() }
    - 개선 ex)
        let minNumber = arr.min()
        var array = arr.filter { $0 != minNumber }


## Day2
### 기억할 내용
- String 인덱싱에 Int 값을 사용하려면 String.Index(encodedOffset:) 사용
    - string[0] 과 같이 사용시 에러 발생
    - string[String.Index(encodedOffset: 0)]로 사용하기!
    - 주의) string.endIndex은 마지막 문자가 아니라 진짜 아무것도 없는 맨 끝, C언어로 따지면 문자열 마지막인 \0의 위치를 반환
        - 따라서, 아래의 4가지 메서드롤 통해 해결해보기
        - func index(String.Index, offsetBy: Int) -> String.Index
        - func index(after i: String.Index) -> String.Index
        - func index(before i: String.Index) -> String.Index
        - func index(of element: Self.Element) -> Self.Index?
- 두 개의 시퀀스를 곱한값을 요소로 삼는 시퀀스 만들기
    - zip(a, b).map(*)
- 수학적 지식 더욱 꼼꼼하게 숙지하기
    - ex) 최소공배수 & 최대공약수
        - 최대공약수를 구했다면 최소 공배수는 각 값을 최대공약수로 나눈 값을 곱함과 같으니 쉽게 답을 구할 수 있었음
        ```
        let a = (1...n).filter { n % $0 == 0 }
        let b = (1...m).filter { m % $0 == 0 }
        let gcd = b.filter { a.contains($0) }.last!
        let lcm = n * m / gcd
        return [gcd, lcm]
        ```
- 정해진 예산에서 차례차례 빼는 방식일 때 좋은 코드
    ```
    var budget = budget
    return d.sorted().filter{
        budget = budget - $0
        return budget >= 0
    }.count
    ```
- 문자열 <-> 유니코드 변환
    - 문자열 -> 유니코드
        - string.utf8.map { $0 }
    - 유니코드 -> 문자열
        - String(UnicodeScalar(string)!)
- '5개->4개->3개...'와 같이 반복문을 하나씩 줄이며 중첩할 때,
    ```
    for i in 0..<numbers.count {
        for j in (i + 1)..<numbers.count {
            for k in (j + 1)..<numbers.count {
                ...
            }
        }
    }
        
    ```

## Day3
### 기억할 내용
- or 연산자 => `|`
    - ex) String(arr1[$0] | arr2[$0], radix: 2)
- String 간단한 인덱싱
    - String.Index(utf16Offset:in:)이 아닌 Array(string)[0]과 같이 간단한 인덱싱 방법도 존재
- 특정 문자 대체 메서드 => `replacingOccurrences(of:with:)`
- Set 또한 sorted() 메서드 존재
    - Array로 형변환을 불필요하게 할 필요 없음
- 문자열의 일부 문자를 자르고 싶을때, prefix 고려하기
    - 문제 ex) t[..<t.index(t.startIndex, offsetBy: p.count)]
    - 개선 ex) t.prefix(p.count)
- **나머지를 이용하는 문제**
    - 이번 경우 콜라문제와 같이, 중첩적으로 나누어지는 값에 대하여 다음과 같이 풀이해보기
        - 나누는 값에 나머지를 자꾸 더하자!
        - 예시
            ```
            var result = n
            var service = 0

            while result / a > 0 {
                service += (result / a) * b
                result = (result / a) * b + result % a
            }

            return service
            ```
- 같은 값에 대하여 최신값으로 업데이트가 필요할 때 Dictionary 고려해보기
    - ex) 문제(가장 가까운 같은 글자) 참고
- **시간 복잡도 최소화 문제**
    - 문제(소수 찾기)에서 이미 소수가 아닌 숫자는 다시 한 번 확인할 필요 X
    - 따라서, Array<Bool>을 만들어 해당 Bool 값을 false로 설정해주고
    - 이후에 조건문을 통해 Bool 값이 false 일시 빠르게 통과되도록!
    - 추가로, 배수의 경우 반복은 해당 배수로 나눈만큼만 하면 됨
    - 즉, 1부터 1000까지 2의 배수를 찾는 경우, 총 반복횟수는 1000/2 번만 하면 됨
    - 예시
        ```
        var primes:[Bool] = [Bool](repeating: true, count: n + 1)
        var count = 0

        for i in 2...n {
            if primes[i] {
                count = count + 1
            }

            for j in 1...(n/i) {
                primes[i * j] = false
            }
        }

        return count
        ```

## Day4
### 기억할 내용
- zip을 사용한 경우, sequence의 길이가 다르면 가장 짧은 sequence를 기준으로 조정
- 소수(PrimeNumber)의 시간 복잡도를 줄이는 방법 연습하기
- 논리 오류가 있을때, 문제의 제한사항을 꼼꼼히 살펴보기

## Day5
### 기억할 내용
- 클로저를 통해 특정 배열을 분리하고 싶으면 split(whereSeparator:) 사용하기
    - ex) 숫자와 문자가 혼합한 배열 분리
        ```
        let numberList = dartResult.split(whereSeparator: { $0.isLetter || $0 == "#" || $0 == "*" })
        let letterList = dartResult.split(whereSeparator: { $0.isNumber })
        ```
- 해당 문자가 문자인지 Bool 값을 반환하는 함수 => isLetter
- 일정 숫자 밑으로 일관된 결과값을 return 하고 싶다면 min()을 활용하는 것도 방법
    - ex) 6개의 로또 번호에서 1개 이하로 맞추면 6등을 반환
        ```
        min(7 - winCount, 6)
        ```
- 약수의 개수 시간 복잡도를 고려하여 작성할 때, 미리 배열을 만들어놓기
    - 예시
        ```
        var countArray = Array(repeating: 0, count: number + 1)

        for i in 1...(countArray.count - 1) {
            for j in 1...((countArray.count - 1) / i) {
                countArray[i * j] += 1
            }
        }

        return countArray.map {
            $0 > limit ? power : $0
        }.reduce(0, +)
        ```

## Day6
### 기억할 내용
- Sequence별 시간복잡도 정리
    - Array
        ```
        - append(_ newElement: Element)
            - 평균 시간 복잡도 => O(1)
            - 최악의 시간복잡도 => O(N)
                - 최악의 상황 => 메모리를 재할당 해야 할 때

        - append(contentsOf:)
            - 평균 시간 복잡도 => O(M)
            - M은 contentsOf 자리에 오는 새로운 Elements의 개수

        - insert(_ newElement: Element, at i: Int)
            - O(N)
            - i가 마지막 index일 경우, append와 시간 복잡도 동일
        
        - count
            - O(1)

        - subscript(_:)
            - read는 항상 O(1)
            - write는 일반적으로 O(1)
                - NSArrary와 brideged 됐을 경우나 다른 arrary와 storage를 공유하고 있을 경우는 O(N) (Copy on Write)
            
        - randomElement()
            - O(1)

        - reserveCapacity(_:)
            - O(N)

        - last
            - O(1)

        - isEmpty
            - O(1)
        
        - popLast(), removeLast()
            - O(1)

        - remove(at:)
            - O(N) 

        - removeFirst()
            - O(N)
            
        - removeAll(keepingCapacity:)
            - O(N)

        - contains(_:), contains(where:)
            - O(N)
            - Set 구조로도 구현 가능하다면, Set로 형변환후 contains() 사용시 시간복잡도 O(1)로 단축 가능

        - allSatisfy(_:)
            - O(N)

        - first(where:), firstIndex(where:), last(where:), lastIndex(where:), firstIndex(of:), lastIndex(of:)
            - O(N)

        - min(), max()
            - O(N)

        - enumerated()
            - O(N)

        - sort(), sorted()
            - O(N logN)
            - Swift에선 MergeSort와 InsertionSort를 기반으로 만든 Timsort를 사용
        
        - reverse()
            - O(n)

        - rereversed()
            - O(1)
            - revese()와 시간복잡도가 상이
            - ReversedCollection을 반환하기 때문
            - ReversedCollection는 참조 순서를 역순으로 하게 만듦

        - shuffle(), shuffled()
            - O(N)

        - partition(by:)
            - O(N)

        - swapAt(_:_:)
            - O(1)

        - split(separator:maxSplits:omittingEmptySubsequences:), split(maxSplits:omittingEmptySubsequences:whereSeparator:)
            - O(N)

        - elementsEqual(_:), ==
            - O(M)
            - M => 두 sequence length중에 더 작은 length
        ```
        
    - Set
        ```
        - subscript(_:)
            - O(1)

        - count
            - O(1)

        - contains(_:)
            - O(1)

        - contains(where:)
            - O(N)

        - removeFirst()
            - 평균 O(1)
            - bridged NSSet으로 Wrap되지 않은 경우, 명시 X

        - firstIndex(of:)
            - O(1)
        ```
        
    - Dictionary
        ```
        - subscript(_:)
            - O(1)

        - count
            - O(1)

        - contains(where:)
            - O(N)
            - contains(_:) method 존재 X
                - key로 바로 참조하면 알 수 있기 때문

        - index(forKey:)
            - 평균 O(1)
            - bridged NSDictionary으로 Wrap된 경우 O(N)

        - mapValues(_:)
            - O(N)

        - compactMapValues(_:)
            - O(M + N)
            - N은 기존 Dictionary의 크기
            - M은 결과 Dictionary의 크기

        - remove(at:), removeValue(forKey:), removeAll(keepingCapacity:)
            - O(N)입니다.

        - popFirst()
            - 평균 O(1)

        - rereversed()
            - O(N)
        ```
        
    - String
        ```
        - count
            - O(N)
            - count가 0인지만 궁금하다면 isEmpty를 사용하여 시간복잡도 O(1)로 단축
        ```
        
    - ClosedRange
        ```
        - contains(_:) , ~=
            - O(1)
        ```
        
    - Higher-order functions(고차함수)
        ```
        - map, flatMap, compactMap, filter, reduce
            - O(n)
        ```
    - 출처(https://demian-develop.tistory.com/30)
- 정수 범위를 넘어나는 경우를 유념하기
    - 코드가 아무리 잘 짜여있어도 정수 범위를 넘어가는 경우 해당 숫자가 잘리게 됨
- replacingOccurrences(of:with:) 사용시, 교체로 인하여 새로운 단어가 생성됨을 유의
    - 예시) myea -> 'ye'지움 문제
        ```
        let possibleWord = ["aya", "ye", "woo", "ma"]
        var problemWord = "myea"
        
        problemWord = problemWord.replacingOccurrences(of: "ye", with: "")
        print(problemWord) // problemWord == "ma"
        
        problemWord = problemWord.replacingOccurrences(of: "ma", with: "")
        print(problemWord) // problemWord == "" 
        
        // 이와 같이, 원래라면 만들어지지 않을 문자가 만들어질 수 있으니 주의!!
        ```

# 이것이 취업을 위한 코딩 테스트다

# Greedy
## 주요 알고리즘 이론과 실전 문제
### 기억할 내용
- Greedy란 현재 상황에서 지금 당장 좋은 것만 고르는 방법
- 문제 풀이를 위한 최소한의 아이디어를 떠올리고, 이것이 정당한지 검토 가능해야 답 도출 가능
- 최소와 최대에 주의하여 풀어보기
- `Part1: 거스름돈` 문제와 같이, 나눌 수들을 크기에 따라 배열에 넣어 푸는 방식 잊지 말기  

## 알고리즘 유형별 기출문제
### 기억할 내용
- array.removeAll() vs array = []
    - removeAll() 메서드의 시간 복잡도는 O(N)이므로, 단순히 빈 배열값을 선언하는 것이 시간복잡도 면에서 효율적이지 않을까 고민
    - 그러나 Swift의 배열은 dynamic array로 구현되어 있기에, 빈 배열로 초기화하는 과정에서 기존 저장 요소를 모두 제거하고 배열의 크기를 조절해야 하므로 시간복잡도가 O(N)임을 확인
    - 따라서, 시간복잡도면에서 동일
- "만들 수 없는 금액" 문제 메커니즘 이해하기
    - 최소 양의 정수를 찾는 문제
    - 목표값과 현재 원소값 사이에 누락된 양의 정수가 있지 않을까하는 고민에 빠짐
    - 그러나, 1부터 순차대로 양의 정수를 추가했고, 목표값이 있거나 만들 수 있다면 충분히 누락없이 진행되고 있음을 확인
- "무지의 먹방 라이브" 문제 메커니즘 이해하기
    - 시간복잡도가 매우 중요한 문제였음
    - 이를 위해, 생략할 수 있는 부분은 대체로 생략하는 것이 좋은 접근이었음
        - 순차적 접근이 아닌, 공통적인 최소 시간을 빼가는 방식으로 접근
        
## 알고리즘 유형별 기출문제
### 기억할 내용
- 시간 복잡도를 항상 생각하기
    - 시간 복잡도를 줄이기 위해 역순 정렬, 혹은 reversed() 사용 후 removeLast(), last 활용해보기
    - enumerated()의 시간복잡는 O(1)

# Implementation
## 주요 알고리즘 이론과 실전 문제
### 기억할 내용
- 실무의 코딩과 코딩 테스트의 차이 이해하기
    - 실무 코딩의 경우, 문제의 제한사항에 기재되지 않은 index out of range 같은 예외 사항일지라도 포괄하여 다루어야 함
    - 그러나, 코딩 테스트의 경우, 입력값이 주어지는 경우가 대부분
    - 따라서, 예외처리를 고려하기 보다는, 빠르게 코드 작성을 목표로!
- `알파벳 => 숫자` 변환 방법
    - 방법1: Dictionary를 활용
    - 방법2: UnicodeScalar 사용
        - unicodeScalar를 기준으로
 목표 알파벳까지의 거리를 인덱스로 활용
        - 예시
            - 표현방식1: "a".unicodeScalars.first!.value // 97
            - 표현방식2: UnicodeScalar("a").value // 97
            - 목표값: "e".unicodeScalars.first!.value // 101
            - 인덱스값으로 활용: "e".unicodeScalars.first!.value - "a".unicodeScalars.first!.value // 4

## 알고리즘 유형별 기출문제
### 기억할 내용
- 띄어쓰기 없는 하나의 문자열, 배열로 return
    - 입력값 예시: "123402"
    - 해결방안1: readLine()!.split(separator: "").map { Int($0)! }
        - Xcode 환경에서는 잘 작동되나, 백준에서는 X
    - 해결방안2: Array(readLine()!).map { Int(String($0))! }
        - 입력 문자열을 배열로 먼저 변환후 mapping 
- 문자열과 숫자가 섞인 문자열 분류
    - isNumber, isLetter 메서드도 고민해보기!
- dropLast()는 시간복잡도 O(1)로, 마지막 요소를 제거한 나머지 배열 전체를 반환
- 특정 값을 이용하여 배열 내 요소를 제거하는 방법
    - 예시)
        ```
        let currentStuff = [3, 5, 1]
        let index = array.firstIndex(of: currentStuff)!
        array.remove(at: index)
        ```
- [[Int]]와 같은 이중배열에서, 첫번째 값을 x, 두번째 값을 y라고 했을때, x 좌표 기준으로 오름차순 정렬하며, x 좌표가 같을 경우 y 좌표 기준으로 오름차순 정렬 시 다음과 같이 코드 작성 
    - 가장 좋은 예시) 튜플로 만들기!
        ```
        // 튜플로 하면 앞에서 부터 비교함!
        return answer.sorted { ($0[0], $0[1], $0[2]) < ($1[0], $1[1], $1[2]) }
        ```
    - 예시) x, y 값 기준으로 위와 같이 정렬하는 경우
        ```
        array.sorted {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else {
                return $0[1] < $1[1]
            }
        }
        ```
    - 예시) x, y, z 값 기준으로 위와 같이 정렬하는 더 복잡한 경우
        ```
        answer.sorted {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else if $0[1] != $1[1] {
                return $0[1] < $1[1]
            } else {
                return $0[2] < $1[2]
            }
        }
        ```
- 원형 구조에서 시계 방향, 반시계 방향으로 갈 수 있는 경우 한 줄로 만들어보기!
    - 예시로 n이 12, weak가 [1, 3, 5]가 주어질 때, [1, 3, 5, 13, 15, 17]로 늘림
        ```
        let extendedWeakPoints = weak + weak.map { $0 + n }
        ```
- 원형 구조에서 연속한 최소 배열로 나누기 위해, 가장 큰 수로 나누는 것보다, 완전탐색으로 돌리는 것이 확실
- 배열의 시작 인덱스는 0부터 시작하는데, 배열의 마지막 인덱스는 count와 동일... 신기하네
    - 예시)
        ```
        print([1,2,3,4,5].startIndex) // 0
        print([1,2,3,4,5].endIndex) // 5
        ```
- 문자열을 원하는 수만큼 자르고 싶을때
    - 예시)
        ```
        func split(_ s: String, by unit: Int) -> [String] {
            var result: [String] = []

            for i in stride(from: 0, to: s.count, by: unit) {
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = s.index(startIndex, offsetBy: unit, limitedBy: s.endIndex) ?? s.endIndex
                let chunk = s[startIndex..<endIndex]
                result.append(String(chunk))
            }

            return result
        }
        ```
- 2차원 배열에서, 또 다른 작은 사이즈의 2차원 배열로 기존 배열의 범위를 벗어나는 범위를 쉽게 포괄하려면, 기존 2차원 배열을 3배로 만들어주면 편함
    - 예시) 
    ```
    private func isMatch(_ lock: [[Int]], _ key: [[Int]], _ x: Int, _ y: Int) -> Bool {
        let lockSize = lock.count
        let keySize = key.count
        var extendedLock = Array(repeating: Array(repeating: 0, count: lockSize * 3), count: lockSize * 3)

        for i in 0..<lockSize {
            for j in 0..<lockSize {
                extendedLock[i + lockSize][j + lockSize] = lock[i][j]
            }
        }

        for i in 0..<keySize {
            for j in 0..<keySize {
                extendedLock[x + i + lockSize][y + j + lockSize] += key[i][j]
            }
        }

        for i in lockSize..<(lockSize * 2) {
            for j in lockSize..<(lockSize * 2) {
                if extendedLock[i][j] != 1 {
                    return false
                }
            }
        }

        return true
    }
    ```

# DFS&BFS
## 주요 알고리즘 이론과 실전 문제
### 기억할 내용
- DFS 기본 구현
    - 예시)
    ```
    func dfs(_ graph: [[Int]], _ v: Int, _ visited: inout [Bool]) {
        visited[v] = true
        print(v, terminator: " ")

        for i in graph[v] {
            if !visited[i] {
                dfs(graph, i, &visited)
            }
        }
    }
    ```
- BFS 기본 구현
    - 예시)
    ```
    func bfs(_ graph: [[Int]], _ start: Int, _ visited: inout [Bool]) {
        var queue: [Int] = []
        queue.append(start)
        visited[start] = true

        while !queue.isEmpty {
            let v = queue.removeFirst()
            print(v, terminator: " ")

            for i in graph[v] {
                if !visited[i] {
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
    }
    ```
