

import Foundation

struct Contact {
    var name: String
    var phone: String
}

struct DictionaryManager {
   
    var arrayContact = [Contact]()
    var dictionaryContact: [String:String] = [:]
    var contact = ""
    
    mutating func createArrayAndDictionary(){
        for i in 1...10_000_000 {
            let name = Contact(name: "Name\(i)", phone: "+380 \(i)")
            arrayContact.append(name)
            dictionaryContact["Name\(i)"] = "+380 \(i)"
        }
    }
    
    mutating func findFirstArr() -> Float {
        let start = Date()
        contact = arrayContact.first?.name ?? "Not found"
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    mutating func findFirstDict() -> Float {
        let start = Date()
        contact = dictionaryContact["Name1"] ?? "Not found"
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    mutating func findLastArr() -> Float {
        let start = Date()
        contact = arrayContact.last?.name ?? "Not found"
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    mutating func findLasttDict() -> Float {
        let start = Date()
        contact = dictionaryContact["Name10000000"] ?? "Not found"
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    mutating func notFindAnythingElelentsInArray() -> Float {
        let start = Date()
        for i in arrayContact {
            if i.name == "Nam" {
                contact = i.name
            } else {
                contact = "Not found"
            }
        }
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
    
    mutating func notFindAnythingElementsInDictionary() -> Float {
        let start = Date()
        contact = dictionaryContact["Name"] ?? "Not found"
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return Float(diff)
    }
}
    
