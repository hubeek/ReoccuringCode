import UIKit
import XCTest

extension String: Error {}

func maxChars(string: String) throws -> String {
    var charMap:[Character:Int] = [Character:Int]()
    
    for char in string {
        if charMap[char] != nil
        {
            charMap[char] = charMap[char]! + 1
        }
        else
        {
            charMap[char] = 1
        }
    }
    let maxi = charMap.max{a,b in a.value < b.value}
    if let value = maxi?.key{
        return "\(value)"
    }
    throw "something wrong"
}


class MaxCharsTest: XCTestCase {
    
    func testMaxCharsWithoutChars() {
        XCTAssertThrowsError(try maxChars(string: ""))
    }
    func testMaxCharsWithChars() {
        XCTAssertEqual(try maxChars(string: "asdasdaa"), "a")
    }
    func testMaxCharsWithnumbers() {
        XCTAssertEqual(try maxChars(string: "123111"), "1")
    }
    func testWithCharsAndNumbers() {
        XCTAssertEqual(try maxChars(string: "ab1c1d1e1f1g1"), "1")
    }
}

MaxCharsTest.defaultTestSuite.run()

