

import XCTest
@testable import Collections_1_6

final class DictCollections_1_6Tests: XCTestCase {

   var dictModel = DictionaryStruct()
    var arrayContact = [Contact]()
    var dictionaryContact: [String:String] = [:]
    
    /*
        dictModel.createArrayAndDictionary()
        arrayContact = dictModel.arrayContact
        dictionaryContact = dictModel.dictionaryContact
        print("aaaaaaaaaa__________aaaAAAAAA_____= \(arrayContact.isEmpty)")
       
*/
    
    
    func arrayIsEmpty(){
        var name : String?
        ( _ , name) = dictModel.findFirstArr(array: arrayContact)
        XCTAssertFalse(name != nil)
        

    }
    

}
