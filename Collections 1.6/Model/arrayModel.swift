//
//  arrayModel.swift
//  Collections 1.6
//
//  Created by YURA																			 on 25.01.2023.
//

import Foundation

struct Methods {
    let titleLabel: String
    let tag: Int
}

struct ArraysModel {
    var startedArray = [Int]()
    
    let arrayLabelMethods = [
        Methods(titleLabel: "Generate an array of integers with 10_000_000 elements", tag: 0),
        Methods(titleLabel: "Insert at the beginning of an array 1000 elements one-by-one", tag: 1),
        Methods(titleLabel: "Insert at the beginning of an array 1000 elements at once", tag: 2),
        Methods(titleLabel: "Insert in the middle of an array 1000 elements one-by-one", tag: 3),
        Methods(titleLabel: "Insert in the middle of an array 1000 elements at once", tag: 4),
        Methods(titleLabel: "Append to the end of an array 1000 elements one-by-one", tag: 5),
        Methods(titleLabel: "Append to the end of an array 1000 elements at once", tag: 6),
        Methods(titleLabel: "Remove at the beginning 1000 elements one-by-one", tag: 7),
        Methods(titleLabel: "Remove at the beginning 1000 elements at once", tag: 8),
        Methods(titleLabel: "Remove in the middle 1000 elements one-by-one", tag: 9),
        Methods(titleLabel: "Remove in the middle 1000 elements at once", tag: 10),
        Methods(titleLabel: "Remove at the end 1000 elements one-by-one", tag: 11),
        Methods(titleLabel: "Remove at the end 1000 elements at once", tag: 12)
    ]
    
    mutating func createArray() -> Float {
        let start = CFAbsoluteTimeGetCurrent()
        startedArray = Array(0...9_999_999)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    func insertToStartOneByOne(array: [Int]) -> Float {
        var array = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            array.insert(i, at: 0)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func insertToStartAtOnce(array: [Int]) -> Float {
        var array = array
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        array.insert(contentsOf: arrayAppend, at: 0)
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func insertToMiddleOneByOne(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            let index = array.count/2
            array.insert(i, at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func insertToMiddleAtOnce(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let index = array.count/2
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        array.insert(contentsOf: arrayAppend, at: index)
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    func appendToEndOneByOne(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            array.append(i)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func appendToEndAtOnce(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        array.append(contentsOf: arrayAppend)
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func removeFirstOneByOne(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            array.removeFirst()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    func removeFirstAtOnce(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        array.removeFirst(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    func removeMiddleOneByOne(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            let index = array.count/2
            array.remove(at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    func removeMiddleAtOnce(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let index = array.count/2 - 500
        let start = CFAbsoluteTimeGetCurrent()
        array.removeSubrange(index...index + 1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func removeLastOneByOne(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            array.removeLast()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
    
    func removeLastAtOnce(array: [Int]) -> Float {
        var array = array
        print(array.count)
        let start = CFAbsoluteTimeGetCurrent()
        array.removeLast(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        print(array.count)
        return Float(diff)
    }
}
