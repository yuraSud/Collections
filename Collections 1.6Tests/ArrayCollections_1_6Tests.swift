
import XCTest
@testable import Collections_1_6

final class Collections_1_6Tests: XCTestCase {
    
    var arrayManeger = ArraysManeger()
    
    var startedArray: [Int] = {
        Array(0...9_999_999)
    }()
    
    func testTimeCreatingArray() {
        measure(
            metrics: [
                XCTClockMetric(),
                XCTCPUMetric(),
                XCTStorageMetric(),
                XCTMemoryMetric()
            ]){
            _ = arrayManeger.createArray()
                XCTAssertFalse(arrayManeger.array.isEmpty)
        }
    }
    
    func testAppendOneByOneAtStart(){
        _ = arrayManeger.insertToStartOneByOne()
        let firstNumber = 1000
        let allCount = 10_001_000
        XCTAssertEqual(arrayManeger.arrayAfterOperations[0], firstNumber)
        XCTAssertEqual(arrayManeger.arrayAfterOperations.count, allCount)
    }
    /*
    func testAppendOnceAtStart(){
        _ = arrayModel.insertToStartAtOnce(array: startedArray)
        let firstNumber = 0
        let allCount = 10_001_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations[1000], firstNumber)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    func testAppendOneByOneAtMiddle(){
        _ = arrayModel.insertToMiddleOneByOne(array: startedArray)
        let numberAtIndex = 1000
        let index = startedArray.count/2
        let endIndex = index + 1000
        let numberOfEndIndex = 10_000_000/2
        let allCount = 10_001_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations[index], numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
        XCTAssertEqual(arrayModel.arrayAfterOperrations[endIndex], numberOfEndIndex)
    }
    
    func testAppendOnceAtMiddle(){
        _ = arrayModel.insertToMiddleAtOnce(array: startedArray)
        let number = 1
        let index = startedArray.count/2
        let allCount = 10_001_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations[index], number)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    
    func testAppendOneByOneAtEnd(){
        _ = arrayModel.appendToEndOneByOne(array: startedArray)
        let numberAtIndex = 1000
        let allCount = 10_001_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations.last, numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    
    func testAppendOnceAtEnd(){
        _ = arrayModel.appendToEndAtOnce(array: startedArray)
        let number = 1000
        let allCount = 10_001_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations.last, number)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    
    func testRemoveOneByOneAtStart(){
        _ = arrayModel.removeFirstOneByOne(array: startedArray)
        let numberAtIndex = 1000
        let allCount = 9_999_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations.first, numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    func testRemoveOnceAtStart(){
        _ = arrayModel.removeFirstAtOnce(array: startedArray)
        let number = 1000
        let allCount = 9_999_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations.first, number)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    func testRemoveOneByOneAtMiddle(){
        _ = arrayModel.removeMiddleOneByOne(array: startedArray)
        let numberAtIndex = 5_000_500
        let indexMiddle = (startedArray.count - 1000) / 2
        let allCount = 9_999_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations[indexMiddle], numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    func testRemoveOnceAtMiddle(){
        _ = arrayModel.removeMiddleAtOnce(array: startedArray)
        let numberAtIndex = 5_000_500
        let indexMiddle = (startedArray.count - 1000) / 2
        let allCount = 9_999_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations[indexMiddle], numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    
    func testRemoveOneByOneAtLast(){
        _ = arrayModel.removeLastOneByOne(array: startedArray)
        let numberAtIndex = 9_999_999 - 1000
        let allCount = 9_999_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations.last, numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }
    func testRemoveOnceAtLast(){
        _ = arrayModel.removeLastAtOnce(array: startedArray)
        let numberAtIndex = 9_999_999 - 1000
        let allCount = 9_999_000
        XCTAssertEqual(arrayModel.arrayAfterOperrations.last, numberAtIndex)
        XCTAssertEqual(arrayModel.arrayAfterOperrations.count, allCount)
    }*/
}


