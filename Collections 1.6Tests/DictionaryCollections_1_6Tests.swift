
@testable import Collections_1_6
import XCTest

final class DictionaryCollections_1_6Tests: XCTestCase {
    
    var dictModel = DictionaryManager()
   
    override func setUp() {
       super.setUp()
        dictModel.createArrayAndDictionary()
    }
    func testCreateArrayAndDictionary() {
        XCTAssertFalse(dictModel.arrayContact.isEmpty)
        XCTAssertFalse(dictModel.dictionaryContact.isEmpty)
    }
    
    func testFindFirstElementInArray() {
        XCTAssertTrue(dictModel.findFirstArr().isFinite)
        XCTAssertEqual(dictModel.contact, "Name1")
    }
    
    func testFindLastElementInArray() {
        XCTAssertTrue(dictModel.findLastArr().isFinite)
        XCTAssertEqual(dictModel.contact, "Name10000000")
    }
    
    func testNotFindElementInArray() {
        XCTAssertTrue(dictModel.notFindAnythingElelentsInArray().isFinite)
        XCTAssertEqual(dictModel.contact, "Not found")
    }
    
    func testFindFirstElementInDict() {
        XCTAssertTrue(dictModel.findFirstDict().isFinite)
        XCTAssertEqual(dictModel.contact, "+380 1")
    }
    
    func testFindLastElementInDict() {
        XCTAssertTrue(dictModel.findLasttDict().isFinite)
        XCTAssertEqual(dictModel.contact, "+380 10000000")
    }
    
    func testNotFindElementInDict() {
        XCTAssertTrue(dictModel.notFindAnythingElementsInDictionary().isFinite)
        XCTAssertEqual(dictModel.contact, "Not found")
    }
}

