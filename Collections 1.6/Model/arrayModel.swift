//
//  arrayModel.swift
//  Collections 1.6
//
//  Created by YURA																			 on 25.01.2023.
//

import Foundation

struct Methods {
    let titleLabel: String
}

struct ArraysModel {
    var startedArray = [Int]()
    var arrayAfterOperrations = [Int]()
    
    let arrayLabelMethods = [
        Methods(titleLabel: "Generate an array of integers with 10_000_000 elements"),
        Methods(titleLabel: "Insert at the beginning of an array 1000 elements one-by-one"),
        Methods(titleLabel: "Insert at the beginning of an array 1000 elements at once"),
        Methods(titleLabel: "Insert in the middle of an array 1000 elements one-by-one"),
        Methods(titleLabel: "Insert in the middle of an array 1000 elements at once"),
        Methods(titleLabel: "Append to the end of an array 1000 elements one-by-one"),
        Methods(titleLabel: "Append to the end of an array 1000 elements at once"),
        Methods(titleLabel: "Remove at the beginning 1000 elements one-by-one"),
        Methods(titleLabel: "Remove at the beginning 1000 elements at once"),
        Methods(titleLabel: "Remove in the middle 1000 elements one-by-one"),
        Methods(titleLabel: "Remove in the middle 1000 elements at once"),
        Methods(titleLabel: "Remove at the end 1000 elements one-by-one"),
        Methods(titleLabel: "Remove at the end 1000 elements at once")
    ]
    
    mutating func createArray() -> Float {
        let start = CFAbsoluteTimeGetCurrent()
        startedArray = Array(0...9_999_999)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToStartOneByOne(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            arrayAfterOperrations.insert(i, at: 0)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToStartAtOnce(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        arrayAfterOperrations.insert(contentsOf: arrayAppend, at: 0)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToMiddleOneByOne(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            let index = array.count/2
            arrayAfterOperrations.insert(i, at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToMiddleAtOnce(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let index = arrayAfterOperrations.count/2
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        arrayAfterOperrations.insert(contentsOf: arrayAppend, at: index)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    mutating func appendToEndOneByOne(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            arrayAfterOperrations.append(i)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func appendToEndAtOnce(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        arrayAfterOperrations.append(contentsOf: arrayAppend)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeFirstOneByOne(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            arrayAfterOperrations.removeFirst()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    mutating func removeFirstAtOnce(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        arrayAfterOperrations.removeFirst(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    mutating func removeMiddleOneByOne(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            let index = arrayAfterOperrations.count/2
            arrayAfterOperrations.remove(at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    mutating func removeMiddleAtOnce(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let index = arrayAfterOperrations.count/2 - 500
        let start = CFAbsoluteTimeGetCurrent()
        arrayAfterOperrations.removeSubrange(index..<index + 1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeLastOneByOne(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            arrayAfterOperrations.removeLast()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeLastAtOnce(array: [Int]) -> Float {
        arrayAfterOperrations = array
        let start = CFAbsoluteTimeGetCurrent()
        arrayAfterOperrations.removeLast(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
}
