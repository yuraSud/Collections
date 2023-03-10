
import Foundation

struct ArraysManager {
    var array = [Int]()
    let semaphore = DispatchSemaphore(value: 1)
    
    
    mutating func createArray() -> Float {
        let start = CFAbsoluteTimeGetCurrent()
        array = Array(0...9_999_999)
        let diff = CFAbsoluteTimeGetCurrent() - start
        return Float(diff)
    }
    
    mutating func insertToStartOneByOne() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            array.insert(i, at: 0)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func insertToStartAtOnce() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        array.insert(contentsOf: arrayAppend, at: 0)
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func insertToMiddleOneByOne() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            let index = array.count/2
            array.insert(i, at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func insertToMiddleAtOnce() -> Float {
        let index = array.count/2
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        array.insert(contentsOf: arrayAppend, at: index)
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    mutating func appendToEndOneByOne() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        for i in 1...1000 {
            array.append(i)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func appendToEndAtOnce() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        let arrayAppend = Array(1...1000)
        array.append(contentsOf: arrayAppend)
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func removeFirstOneByOne() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            array.removeFirst()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    mutating func removeFirstAtOnce() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        array.removeFirst(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func removeMiddleOneByOne() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            let index = array.count/2
            array.remove(at: index)
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func removeMiddleAtOnce() -> Float {
        semaphore.wait()
        let index = array.count/2 - 500
        let start = CFAbsoluteTimeGetCurrent()
        array.removeSubrange(index..<index + 1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func removeLastOneByOne() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        for _ in 1...1000 {
            array.removeLast()
        }
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
    
    mutating func removeLastAtOnce() -> Float {
        semaphore.wait()
        let start = CFAbsoluteTimeGetCurrent()
        array.removeLast(1000)
        let diff = CFAbsoluteTimeGetCurrent() - start
        semaphore.signal()
        return Float(diff)
    }
}
