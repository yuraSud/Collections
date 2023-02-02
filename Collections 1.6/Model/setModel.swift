

import Foundation

struct Setmatching {
    
    func allMtchingLetters(text1: String, text2: String) -> String {
        let resultSet = Set(text1).intersection(Set(text2)).sorted()
        var resultString = ""
        for i in resultSet {
            resultString.append(i)
        }
        return resultString
    }
    
    func noMtchingLetters(text1: String, text2: String) -> String {
        let resultSet = Set(text1).symmetricDifference(Set(text2)).sorted()
        var resultString = ""
        for i in resultSet {
            resultString.append(i)
        }
        return resultString
    }
    
    func uniqueFirstTFLetters(text1: String, text2: String) -> String {
        let resultSet = Set(text1).subtracting(Set(text2)).sorted()
        var resultString = ""
        for i in resultSet {
            resultString.append(i)
        }
        return resultString
    }
    
    func onlyLetters(text: String) -> Bool {
        let regularExpression = "[A-Za-z А-Яа-я]{0,}"
        //let regularExpression = ".*[\'`][ @,<>=+*:;#~|/^!$%&?._0-9-]+.*"
        return NSPredicate(format: "SELF MATCHES %@", regularExpression).evaluate(with: text)
    }
}
