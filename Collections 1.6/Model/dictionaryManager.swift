

import Foundation

struct Contact {
    var name: String
    var phone: String
}

struct DictionaryManager {
   
    var arrayContact = [Contact]()
    var dictionaryContact: [String:String] = [:]
    
    mutating func createArrayAndDictionary(){
        for i in 1...10_000_000 {
            let name = Contact(name: "Name\(i)", phone: "+380 \(i)")
            arrayContact.append(name)
            dictionaryContact["Name\(i)"] = "+380 \(i)"
        }
    }
    
    func findFirstArr() -> Float {
        let start = Date()
        let first = arrayContact.first?.name
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    func findFirstDict() -> Float {
        let start = Date()
        let first = dictionaryContact["Name1"]
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    func findLastArr() -> Float {
        let start = Date()
        let last = arrayContact.last?.name
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    func findLasttDict() -> Float {
        let start = Date()
        let last = dictionaryContact["Name10000000"]
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    func notFindAnythingElelentsInArray() -> Float {
        let start = Date()
        for i in arrayContact {
            if i.name == "Nam" {
                let _ = i.name
            }
        }
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    func notFindAnythingElementsInDictionary() -> Float {
        let start = Date()
        let last = dictionaryContact["Name"]
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
}
    
