
@testable import Collections_1_6
import XCTest
/*
final class DictionaryCollections_1_6Tests: XCTestCase {
    
    var dictModel = DictionaryManager()
    var arrayContact : [Contact] = {
        var arCont = [Contact]()
        for i in 1...10_000_000 {
            let name = Contact(name: "Name\(i)", phone: "+380 \(i)")
            arCont.append(name)
        }
        return arCont
    }()
    
    var dictionaryContact: [String:String] = {
        var dictCont = [String:String]()
        for i in 1...10_000_000 {
            dictCont["Name\(i)"] = "+380 \(i)"
        }
        return dictCont
    }()
    
    func testCreateArrayAndDictionary() {
        dictModel.createArrayAndDictionary()
        let arrIsEmpty = dictModel.arrayContact.isEmpty
        let dictIsEmpty = dictModel.dictionaryContact.isEmpty
        XCTAssertFalse(arrIsEmpty)
        XCTAssertFalse(dictIsEmpty)
    }
   
    func testFindFirstElementInArray() {
        var text : String?
        (_,text) = dictModel.findFirstArr(array: arrayContact)
        let firstElement = "Name1"
        XCTAssertEqual(text, firstElement)
    }
    
    func testFindLastElementInArray() {
        var text : String?
        (_,text) = dictModel.findLastArr(array: arrayContact)
        let firstElement = "Name10000000"
        XCTAssertEqual(text, firstElement)
    }
    
    func testNotFindElementInArray() {
        var text : String?
        (_,text) = dictModel.notFindAnythingElelentsInArray(array: arrayContact)
        XCTAssertNil(text)
    }
    
    func testFindFirstElementInDict() {
        var text : String?
        (_,text) = dictModel.findFirstDict(dictionary: dictionaryContact)
        let firstElement = "+380 1"
        XCTAssertEqual(text, firstElement)
    }
    
    func testFindLastElementInDict() {
        var text : String?
        (_,text) = dictModel.findLasttDict(dictionary: dictionaryContact)
        let firstElement = "+380 10000000"
        XCTAssertEqual(text, firstElement)
    }
    
    func testNotFindElementInDict() {
        var text : String?
        (_,text) = dictModel.notFindAnythingElementsInDictionary(dictionary: dictionaryContact)
        XCTAssertNil(text)
    }
  

}
*/
