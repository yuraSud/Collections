

import Foundation

struct Contact {
    var name: String
    var phone: String
}

struct DictionaryStruct {
    var arrayContact = [Contact]()
    var dictionaryContact: [String:String] = [:]
    
    let menuItem = [
        "Find the first contact",
        "Find the first contact",
        "Find the last contact",
        "Find the last contact",
        "Search for a non-existing element",
        "Search for a non-existing element"]
    
    mutating func createArrayAndDictionary(){
        for i in 1...10_000_000 {
            let name = Contact(name: "Name\(i)", phone: "+380 \(i)")
            arrayContact.append(name)
            dictionaryContact["Name\(i)"] = "+380 \(i)"
        }
    }
    
    func findFirstArr(array: [Contact]) -> (Float, String?) {
        let start = Date()
        let first = array.first?.name
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return (Float(diff), first)
    }
    
    func findFirstDict(dictionary: [String:String]) -> (Float, String?) {
        let start = Date()
        let first = dictionary["Name1"]
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return (Float(diff), first)
    }
    
    func findLastArr(array: [Contact]) -> (Float, String?) {
        let start = Date()
        let last = array.last?.name
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return (Float(diff), last)
    }
    
    func findLasttDict(dictionary: [String:String]) -> (Float, String?) {
        let start = Date()
        let last = dictionary["Name10000000"]
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return (Float(diff), last)
    }
    
    func findNoElelentsArr(array: [Contact]) -> (Float, String?) {
        var find: String? = nil
        let start = Date()
        for i in array {
            if i.name == "Nam" {
                find = i.name
            }
        }
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return (Float(diff), find)
    }
    
    func findNoElementsDict(dictionary: [String:String]) -> (Float, String?) {
        let start = Date()
        let last = dictionary["Name"]
        let end = Date()
        let diff = end.timeIntervalSince(start)
        return (Float(diff), last)
    }
}
    
