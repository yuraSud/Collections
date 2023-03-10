
import XCTest
@testable import Collections_1_6

final class Collections_1_6Tests: XCTestCase {
    
    var arrayManager = ArraysManager()
    
    override func setUpWithError() throws {
        _ = arrayManager.createArray()
    }
    
    func testArrayAfterCreationForTrue() {
        XCTAssertTrue(arrayManager.array.count == 10_000_000)
        XCTAssertFalse(arrayManager.array.count == 0)
    }
    
    func testArrayInsertElementsToStartOneByOne() {
        _ = arrayManager.insertToStartOneByOne()
        print(arrayManager.array.count)
        XCTAssertTrue(arrayManager.array.count == 10_001_000)
        let addedArray = 1000
        let originalArray = 0
        XCTAssertEqual(arrayManager.array[0], addedArray)
        XCTAssertEqual(arrayManager.array[1000], originalArray)
    }

       func testArrayInsertElementsToStartAtOnce() {
           XCTAssertTrue(arrayManager.insertToStartAtOnce().isFinite)
           XCTAssertTrue(arrayManager.array.count == 10_001_000)
           XCTAssertEqual(arrayManager.array[0], 1)
           XCTAssertEqual(arrayManager.array[1000], 0)
       }
       
       func testArrayinsertElementsToMiddleOneByOn() {
           let middleArreyIndex = arrayManager.array.count / 2
           XCTAssertTrue(arrayManager.insertToMiddleOneByOne().isFinite)
           XCTAssertTrue(arrayManager.array.count == 10_001_000)
           let arrayData = 2
           XCTAssertEqual(arrayManager.array[middleArreyIndex], arrayData)
       }
       
       func testArrayinsertElementsToMiddleAtOnce() {
           let middleArreyIndex = arrayManager.array.count / 2
           XCTAssertTrue(arrayManager.insertToMiddleAtOnce().isFinite)
           XCTAssertTrue(arrayManager.array.count == 10_001_000)
           let arrayData = 1
           XCTAssertEqual(arrayManager.array[middleArreyIndex], arrayData)
       }
       
       func testArrayAppendElementsToEndOneByOne() {
           XCTAssertTrue(arrayManager.appendToEndOneByOne().isFinite)
           XCTAssertTrue(arrayManager.array.count == 10_001_000)
           XCTAssertEqual(arrayManager.array.last, 1000)
       }
       
       func testArrayAppenElementsToEndAtOnce() {
           XCTAssertTrue(arrayManager.appendToEndAtOnce().isFinite)
           XCTAssertTrue(arrayManager.array.count == 10_001_000)
           XCTAssertEqual(arrayManager.array.last, 1000)
       }
       
       func testArrayRemoveFirstElementsOneByOne() {
           XCTAssertTrue(arrayManager.removeFirstOneByOne().isFinite)
           XCTAssertTrue(arrayManager.array.count == 9_999_000)
           XCTAssertEqual(arrayManager.array.first, 1000)
       }
       
       func testArrayRemoveFirstElementsAtOnce() {
           XCTAssertTrue(arrayManager.removeFirstAtOnce().isFinite)
           XCTAssertTrue(arrayManager.array.count == 9_999_000)
           XCTAssertEqual(arrayManager.array.first, 1000)
       }
       
       func testArrayRemoveMiddleElementsOneByOne() {
           XCTAssertTrue(arrayManager.removeMiddleOneByOne().isFinite)
           XCTAssertTrue(arrayManager.array.count == 9_999_000)
           let numberAtIndex = 5_000_500
           let indexMiddle = arrayManager.array.count / 2
           XCTAssertEqual(arrayManager.array[indexMiddle], numberAtIndex)
       }
       
       func testArrayRemoveMiddleElementsAtOnce() {
           XCTAssertTrue(arrayManager.removeMiddleAtOnce().isFinite)
           XCTAssertTrue(arrayManager.array.count == 9_999_000)
           let numberAtIndex = 5_000_500
           let indexMiddle = arrayManager.array.count / 2
           XCTAssertEqual(arrayManager.array[indexMiddle], numberAtIndex)
       }
       
       func testArrayRemoveLastElementsOneByOne() {
           XCTAssertTrue(arrayManager.removeLastOneByOne().isFinite)
           XCTAssertTrue(arrayManager.array.count == 9_999_000)
           let numberAtIndex = 9_999_999 - 1000
           XCTAssertEqual(arrayManager.array.last, numberAtIndex)
       }
       
       func testArrayRemoveLastElementsAtOnce() {
           XCTAssertTrue(arrayManager.removeLastAtOnce().isFinite)
           XCTAssertTrue(arrayManager.array.count == 9_999_000)
           let numberAtIndex = 9_999_999 - 1000
           XCTAssertEqual(arrayManager.array.last, numberAtIndex)
       }
}


