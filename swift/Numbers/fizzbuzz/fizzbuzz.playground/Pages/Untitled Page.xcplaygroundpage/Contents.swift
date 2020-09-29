import UIKit
import XCTest

func fizzbuzz(number n:Int) -> [String]
{
    var result:[String] = []
    for i in 1...n {
        
        if (i % 3) == 0 && (i % 5) == 0 {
//            print("fizzbuzz")
            result.append("fizzbuzz")
        } else if  (i % 3) == 0 {
//            print("fizz")
            result.append("fizz")
        } else if (i % 5) == 0 {
//            print("buzz")
            result.append("buzz")
        } else {
//           print(i)
            result.append("\(i)")
        }
    }
    return result
}

//print(fizzbuzz(number: 15))

class FizzbuzzTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testFizzbuzzOne() {
       XCTAssertEqual(fizzbuzz(number: 1), ["1"])
    }
    func testFizzbuzzThreeisFizz() {
        XCTAssertEqual(fizzbuzz(number: 3).last, "fizz")
    }
    func testFizzbuzzFiveisBuzz() {
        XCTAssertEqual(fizzbuzz(number: 5).last, "buzz")
    }
    func testFizzbuzzFifteenIsFIZZBUZZ() {
        XCTAssertEqual(fizzbuzz(number: 15).last,"fizzbuzz")
    }
    func testFizzbuzzFifteen() {
        XCTAssertEqual(fizzbuzz(number: 15), ["1", "2", "fizz", "4", "buzz", "fizz", "7", "8", "fizz", "buzz", "11", "fizz", "13", "14", "fizzbuzz"])
    }
}

FizzbuzzTest.defaultTestSuite.run()
