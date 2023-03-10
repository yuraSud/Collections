

import XCTest
@testable import Collections_1_6

final class SetCollections_1_6Tests: XCTestCase {

    var setModel = SetManager()

    func testLettersOne(){
        let text1 = "Qwante"
        let text2 = "Quwes"
        let matching = "Qew"
        let notMatch = "anstu"
        let uniqueText1 = "ant"
        let test1 = setModel.allMatchingLetters(text1: text1, text2: text2)
        let test2 = setModel.noMatchingLetters(text1: text1, text2: text2)
        let test3 = setModel.uniqueFirstTFLetters(text1: text1, text2: text2)

        XCTAssertEqual(test1, matching)
        XCTAssertEqual(test2, notMatch)
        XCTAssertEqual(test3, uniqueText1)
    }

    func testLettersTwo(){
        let text1 = "real"
        let text2 = "Ant"
        let test = setModel.allMatchingLetters(text1: text1, text2: text2)

        XCTAssertTrue(test.isEmpty)
    }

    func testLettersInput(){
        let text = "sd26=-"
        let text2 = "ko9/*-+/.,)"
        let text3 = "Text only"

        let test = setModel.onlyLetters(text: text)
        let test2 = setModel.onlyLetters(text: text2)
        let test3 = setModel.onlyLetters(text: text3)

        XCTAssertFalse(test)
        XCTAssertFalse(test2)
        XCTAssert(test3)
    }

}

