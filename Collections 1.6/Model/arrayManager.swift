
import Foundation

struct ArraysManeger {
    var array = [Int]()
    var arrayAfterOperations = [Int]()
    
    mutating func createArray() -> Float {
        let start = CFAbsoluteTimeGetCurrent()
        array = Array(0...9_999_999)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToStartOneByOne() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            arrayAfterOperations.insert(i, at: 0)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToStartAtOnce() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        arrayAfterOperations.insert(contentsOf: arrayAppend, at: 0)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToMiddleOneByOne() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            let index = array.count/2
            arrayAfterOperations.insert(i, at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToMiddleAtOnce() -> Float {
        arrayAfterOperations = array
        let index = arrayAfterOperations.count/2
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        arrayAfterOperations.insert(contentsOf: arrayAppend, at: index)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    mutating func appendToEndOneByOne() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            arrayAfterOperations.append(i)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func appendToEndAtOnce() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        arrayAfterOperations.append(contentsOf: arrayAppend)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeFirstOneByOne() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            arrayAfterOperations.removeFirst()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    mutating func removeFirstAtOnce() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        arrayAfterOperations.removeFirst(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeMiddleOneByOne() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            let index = arrayAfterOperations.count/2
            arrayAfterOperations.remove(at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeMiddleAtOnce() -> Float {
        arrayAfterOperations = array
        let index = arrayAfterOperations.count/2 - 500
        let start = CFAbsoluteTimeGetCurrent()
        arrayAfterOperations.removeSubrange(index..<index + 1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeLastOneByOne() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            arrayAfterOperations.removeLast()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func removeLastAtOnce() -> Float {
        arrayAfterOperations = array
        let start = CFAbsoluteTimeGetCurrent()
        arrayAfterOperations.removeLast(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
}
