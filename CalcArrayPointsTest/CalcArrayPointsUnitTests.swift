//
//  CalcArrayPointsUnitTests.swift
//  CalcArrayPointsUnitTests
//
//  Created by Sam Bender on 10/6/16.
//  Copyright © 2016 Sam Bender. All rights reserved.
//

import XCTest

class CalcArrayPointsUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //
    // MARK: Part 1
    //
    
    func testCalcBasic() {
        // add
        let result = add(left: 5, right: 4) == 9
        XCTAssert(result)
        
        // subtract
        XCTAssert(subtract(left: 4, right: 2) == 2)
        
        // multiply
        XCTAssert(multiply(left: 88, right: 2) == 176)
        
        // divide
        XCTAssert(divide(left: 88, right: 2) == 44)
    }
    
    func testCalcGeneric() {
        let addGenericResult = mathOperation(left: 4, right: 5, operation: add)
        let subtractGenericResult = mathOperation(left: 4, right: 5, operation: subtract)
        let multiplyGenericResult = mathOperation(left: 4, right: 5, operation: multiply)
        let divideGenericResult = mathOperation(left: 20, right: 5, operation: divide)
        
        XCTAssert(addGenericResult == 9)
        XCTAssert(subtractGenericResult == -1)
        XCTAssert(multiplyGenericResult == 20)
        XCTAssert(divideGenericResult == 4)
    }
    
    //
    // MARK: Part 2
    //
    
    func testArrayFun() {
        let testArray = [1, 2, 3, 4, 5]
        
        let addResult = add(array: testArray)
        let addResultGeneric = reduce(array: testArray, operation: add)
        XCTAssert(addResult == 15)
        XCTAssert(addResultGeneric == 15)
        
        // note: i will check that you use reduce to implement the multiply function
        let multiplyResult = multiply(array: testArray)
        XCTAssert(multiplyResult == 120)
        
        // note: i will check that you use reduce to implement the average function
        let averageResult = average(array: testArray)
        XCTAssert(averageResult == 3)
        
        // note: i will check that you use reduce to implement the count function
        let countResult = count(array: testArray)
        XCTAssert(countResult == 5)
    }
    
    //
    // MARK: Part 3
    // 
    
    func testPoints() {
        let testPoint1 = (2, 6)
        let testPoint2 = (5, 4)
        let dictionaryIntTest1 = [
                "x" : 2,
                "y" : 6
        ]
        let dictionaryIntTest2 = [
                "x" : 5,
                "y" : 4
        ]
        let dictionaryDoubleTest1 = [
                "x" : 2.6,
                "y" : 3.5
        ]
        let dictionaryDoubleTest2 = [
                "x" : 5.5,
                "y" : 4.5
        ]
        
        let addPointResult = add(p1: testPoint1, p2: testPoint2)
        XCTAssert(addPointResult.0 == 7 && addPointResult.1 == 10)
        
        let subtractPointResult = subtract(p1: testPoint1, p2: testPoint2)
        XCTAssert(subtractPointResult.0 == -3 && subtractPointResult.1 == 2)
        
        let addPointDictionaryResult = add(p1: dictionaryIntTest1, p2: dictionaryIntTest2)!
        XCTAssert(addPointDictionaryResult["x"]! == 7 && addPointDictionaryResult["y"]! == 10)
        
        let subtractPointDictionaryResult = subtract(p1: dictionaryIntTest1, p2: dictionaryIntTest2)!
        XCTAssert(subtractPointDictionaryResult["x"]! == -3 && subtractPointDictionaryResult["y"]! == 2)
        
        let addPointDoubleDictionaryTest = add(p1: dictionaryDoubleTest1, p2: dictionaryDoubleTest2)!
        XCTAssert(addPointDoubleDictionaryTest["x"]! == 8.1
                  && addPointDoubleDictionaryTest["y"]! == 8.0)
        
        let subtractPointDoubleDictionaryTest = subtract(p1: dictionaryDoubleTest1, p2: dictionaryDoubleTest2)!
        XCTAssert(subtractPointDoubleDictionaryTest["x"]! == -2.9
                  && subtractPointDoubleDictionaryTest["y"]! == -1.0)
        
        // don't crash on nil
        let nilEntryDict : Dictionary<String, Double>? = nil
        let xNilEntryDict : Dictionary<String, Double>? = ["y": 1.0]
        let yNilEntryDict : Dictionary<String, Double>? = ["y": 1.0]
        
        XCTAssertNoThrow(add(p1: nilEntryDict, p2: dictionaryDoubleTest2))
        XCTAssertNoThrow(add(p1: xNilEntryDict, p2: dictionaryDoubleTest2))
        XCTAssertNoThrow(add(p1: yNilEntryDict, p2: dictionaryDoubleTest2))
        XCTAssertNoThrow(add(p1: xNilEntryDict, p2: yNilEntryDict))
        
        XCTAssertNoThrow(subtract(p1: nilEntryDict, p2: dictionaryDoubleTest2))
        XCTAssertNoThrow(subtract(p1: xNilEntryDict, p2: dictionaryDoubleTest2))
        XCTAssertNoThrow(subtract(p1: yNilEntryDict, p2: dictionaryDoubleTest2))
        XCTAssertNoThrow(subtract(p1: xNilEntryDict, p2: yNilEntryDict))
    }
    
    /**
     * For some reason this is an objective-c only test macro 
     * Apple docs for objective-c version: https://developer.apple.com/reference/xctest/xctassertnothrow
     * The (modified) solution below was found here: http://jernejstrasner.com/2015/07/08/testing-throwable-methods-in-swift-2.html
     */
    func XCTAssertNoThrow<T>(_ expression: @autoclosure () throws -> T, _ message: String = "", file: StaticString = #file, line: UInt = #line) {
        do {
            let _ = try expression()
        } catch let error {
            XCTFail("Caught error: \(error) - \(message)", file: file, line: line)
        }
    }
}
