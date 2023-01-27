//
//  setModel.swift
//  Collections 1.6
//
//  Created by YURA																			 on 26.01.2023.
//

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
        let regularExpression = ".*[a-zA-Zа-яА-Я]+.*"
        return NSPredicate(format: "SELF MATCHES %@", regularExpression).evaluate(with: text)
    }
    
}
