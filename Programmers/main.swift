//
//  main.swift
//  Programmers
//
//  Created by 전민수 on 2023/02/27.
//

import Foundation

//MARK: - 프로그래머스 Level 0

//print(substract(2, 3))
//print(getRemainderOf(10, 5))
//print(multiply(3, 5))
//print(add(2, 6))
//print(mod(10, 3))
//print(divide(7, 3))
//print(compare(3, 3))
//print(addFractionsOf(9, 2, 1, 3))
//print(double([1, 2, 3, 4, 5]))
//print(calculateBirthYear(40))
//print(protractor(130))
//print(median([9, -1, 0]))
//print(mode([1, 1, 2, 2]))
//print(oddNumberedArray(16))
//print(makePizzaFor(15))
//print(makePizza2For(6))
//print(makePizza3For(7, 10))
//print(averageOf([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
//print(discount(580000))
//print(iceAmericano(15000))
//print(reverseArray([1, 2, 3, 4, 5]))
//print(reverseString("jaron"))
//printRightAngledTriangle()
//print(obtainOddEvenNumbers([1, 2, 3, 4, 5]))
//print(printCharactersRepeatedly("hello", 3))
//print(removeSpecificLetter("BCBdbe", "B"))
//print(payForLambSkewer(64, 6))
//print(sumOfEvenNumbers(4))
//print(cutArray([1, 2, 3, 4, 5], 1, 3))
//print(convertElementToLength(["We", "are", "the", "world!"]))
//print(getHeightRanking([149, 180, 192, 170], 167))
//print(createMaximumIn([0, 31, 24, 10, 1, 9]))
//print(createMaximum2In([1, 2, -3, 4, -5]))
//print(convertAgeToProgrammer962(100))
//print(findLocationOf([-7, 9]))
//print(orderTreatmentBy([1, 2, 3, 4, 5, 6, 7]))
//print(findNumberOfOrderedPair(20))
//print(organizerAntCorps(23))
//print(morseCode(".... . .-.. .-.. ---"))
//print(rockSissorsPaper("205"))
//print(shareBead(12, 3))
//print(twoDimensionalArray([100, 95, 2, 4, 5, 6, 18, 33, 948], 3))
//print(throwBall([1, 2, 3, 4, 5, 6], 5))
//print(rotateArray([4, 455, 6, 4, -1, 45, 6], "left"))
//print(fillWithDicesIn([10, 8, 6], 3))
//print(findCompositeNumber(10))
//print(factorial(7))
//print(removeVowelIn("bus"))
//print(sortString("p2o4i8gj2"))
//print(addNumberIn("aAb1B2cC34oOp"))
//print(factorizationIntoPrime(420))
//print(controlZ("10 Z 20 Z 1"))
//print(removeDuplicateCharactersIn("We are the world"))
//print(makeTriangle([199, 72, 222]))
//print(findTheNearestNumberIn([10, 11, 12], 13))
//print(game369(10000))
//print(breakTheCode("dfjardstddetckdaccccdegk", 4))
//print(switchUpperAndLowerCase("abCdEfghIJ"))
//print(convertEnglishToNumber("onetwothreefourfivesixseveneightnine"))
//print(changeIndex("I love you", 3, 6))
//print(findUniqueCharacter("abcabcadc"))
//print(findDivisorsOf(24))
//print(findLengthOfLetter("happy birthday!"))
//print(findTheBiggestNumberIn([9, 10, 11, 8]))
//print(calculateStringNumber("3 + 4"))
//print(countSameNumberBetween(["a", "b", "c"], ["com", "b", "d", "p", "c"]))
//print(findNumber(232443, 4))
//print(sortMultipleOf(3, [4, 5, 6, 7, 8, 9, 10, 11, 12]))
//print(addDigits(930211))
//print(grade(["19 - -6 = 13", "5 + 66 = 71", "5 - 15 = 63", "3 - 1 = 2"]))
//print(findString("ab6CDE443fgh22iJKlmn1o", "6CD"))
//print(distinguishSquareNumber(946))
//print(multiplyBacteria(2, 10))
//print(alignString2("Bcad"))
//print(countSeven([7, 77, 17]))
//print(slice("abc1Addfggg4556b", 6))
//print(countDuplicateNumberIn([1, 1, 2, 3, 4, 5], 1))
//print(findAreaOfRectangle([[1, 1], [3, 3], [1, 3], [3, 1]]))
//print(moveGameCharacter(["left", "right", "up", "right", "right"], [11, 11]))
//print(addPolynomial("x + 3 + 4 + 5x"))
//print(addNumberIn2("1a2b3c4d123Z"))
//print(findSafetyZone([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]]))
//print(makeTriangle2([11, 7]))
//print(alienDictionary(["p", "o", "s"], ["def", "dww", "dzx", "loveaw", "sop"]))
//print(parellel([[1, 4], [9, 2], [3, 8], [11, 6]]))
//print(calculateLengthOfOverlappedLine([[0, 5], [3, 9], [1, 10]]))
//print(determineFiniteDecimal(1, 16))
//print(sortCloseNumber([1, 2, 3, 4, 5, 6], 4))
//print(rank([[80, 70], [70, 80], [30, 50], [90, 100], [100, 90], [100, 100], [10, 30]]))
//print(babble(["aya", "yee", "u", "maa", "wyeoo"]))
//print(logIn(["meosseugi", "1234"], [["rardss", "123"], ["yyoom", "1234"], ["meosseugi", "1234"]]))
//print(logIn(["programmer01", "15789"], [["programmer02", "111111"], ["programmer00", "134"], ["programmer01", "1145"]]))
//print(logIn(["rabbit04", "98761"], [["jaja11", "98761"], ["krong0313", "29440"], ["rabbit00", "111333"]]))
//print(orderChicken(1999))
//print(addBinaryNumber("011", "1000"))
//print(transform("allpe", "apple"))
//print(countSpecificNumber(1, 13, 1))
//print(rotateString("123456789012345678901234567890", "567890123456789012345678901234"))
//print(cutPaper(2, 5))
//print(guessNextNumber([0, -2, -4, -6]))
//print(addContinualNumber(4, 14))
//print(calculateAverage([1,2,3,4]))
//print(classifyOddOrEven(3))
//print(sumOfDivisor(12))
//print(sumOfCiphers(987))
//print(findNumberSpacedBy(0, 3))
//print(flipNaturalNumberToArray(12345))
//print(findSquareNumberOfInteger(121))
//print(compareNumberOfPAndY("pPoooyY"))
//print(findNumberWhichTheRestIsOne(10))
//print(placeIntegerInDescendingOrder(118372))
//print(converStringToInteger("-1234"))
//print(findHarshadNumber(13))
//print(sumBetweenTwoIntegers(5, 3))
//print(collatzConjecture(6))
//print(searchForMrKimIn(["Jane", "Kim"]))
//print(returnNumberArrayWithNoRemainder([5, 9, 7, 10], 5))
//print(hidePhoneNumber("01033339444"))
//print(sumOfPlusAndMinusNumbers([4,7,12], [true,false,true]))
//print(eliminateMinNumber([4,3,2,1]))
//print(sumOfNoMentionedNumber([1,2,3,4,6,7,8,0]))
//print(extractMiddleText("qwer"))
//print(repeatWatermelon(4))
//print(dotProduct([1,2,3,4], [-3,-1,0,2]))
//print(placeTextInDescendingOrder("Zbcdefg"))
//print(sumAccordingToTheNumberOfDenominators(13, 17))
//print(checkString("a234"))
//print(calculateInsufficientMoney(3, 20, 4))
//drawRectangleWithAsterisk()
//print(GCDAndLCM(3, 12))
//print(reverseTernaryNumber(45))
//print(createStrangeString("try hello world"))
//print(appropriateBudget([2,2,3,3], 10))
//print(convertToCaesarPassword("a B z", 4))
//print(nominateTrio([-3, -2, -1, 0, 1, 2, 3]))
//print(makeWallet([[60, 50], [30, 70], [60, 30], [80, 40]]))
//print(decipherSecretMap(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
//print(sortStringOnMyOwn(["abce", "abcd", "cdx"], 2))
//print(converStringNumberToInt("one4seveneight"))
//print(cutArrayAndFindNumber([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
//print(pickTwoNumbersAndAdd([2,1,3,4,1]))
//print(countNumberOfSmallerSubString("3141592", "271"))
//print(calculatePossibleAmountOfCoke(3, 2, 20))
//print(placeFood([1, 3, 4, 6]))
//print(returnDayIn2016(3, 1))
//print(findTheNearestSameString("banana"))
//print(countPrimeNumberfromOneTo(10000))
//print(rankMockTest([1,2,3,4,5]))
//print(makePrimeNumber([1,2,3,4]))
//print(calculateFailureRate(4, [4, 4, 4, 4, 4]))
//print(sellFruits(4, 3, [4, 1, 2, 2, 4, 4, 4, 4, 1, 2, 4, 2]))
//print(returnTheLowestScoreInHallOfFame(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]))
//print(playDartGame("1S2D*3T"))
//print(forecastPossibleRank([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
//print(calculateNumberOfSteel(10, 3, 2))
//print(paint(8, 4, [2, 3, 6, 7]))
//print(canReachToGoalWithCards(["i", "drink", "water"], ["want", "to"], ["i", "want", "to", "drink", "water"]))
//print(countNumberOfStudentsWearingGymClothes(5, [2, 4], [2, 4]))
//print(makeNumberPairs("100", "2345"))
//print(babble2(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa", "aya", "ye", "woo", "ma", "woowo"]))
//print(pressKeypad([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
//print(playClawMachineGame([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
//returnCountOfCoinsForChanges()
//returnCountOfCoinsForChanges2()
//ruleOfBigNumber()
//playNumberCardGame()
//calculateUntilNumberReachesOne()
//print(createGuildOfAdventurers())
//print(addOrMultiply())
//print(turnString())
//print(findTheSmallestUnconstructableValue())
//print(pickABowlingBall())
//print(startFoodLiveOfMuzi([3, 1, 2], 5))
//numberOfMeetingRoom()
calculateMinimumCostOfDairyProducts()
