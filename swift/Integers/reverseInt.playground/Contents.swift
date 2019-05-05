import UIKit
import XCTest
// Given an integer, return an integer that is the reverse
// ordering of numbers.
// --- Examples
//   reverseInt(15) === 51
//   reverseInt(981) === 189
//   reverseInt(500) === 5
//   reverseInt(-15) === -51
//   reverseInt(-90) === -9
extension String: Error {}

func reverse(integer n: Int) throws -> Int {
    guard n != 0 else {
        return 0
    }
    let nToString = String(abs(n))
    let splittedAndReversed = Array(nToString).reversed()
    var factor = 1
    if n < 0 { factor = -1}
    let s = String(splittedAndReversed)
    if let result = Int(s) {
        return result * factor
    }
    throw "something went wrong, maybe integer out of scope?"
}

class ReverseIntegersTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testReversePositiveNumbers() {
        XCTAssertEqual(try reverse(integer: 1), 1)
        XCTAssertEqual(try reverse(integer: 12), 21)
        XCTAssertEqual(try reverse(integer: 123), 321)
    }
    func testReverseNegativeNumbers() {
        XCTAssertEqual(try reverse(integer: -1), -1)
        XCTAssertEqual(try reverse(integer: -12), -21)
        XCTAssertEqual(try reverse(integer: -123), -321)
        XCTAssertEqual(try reverse(integer: -1234), -4321)
    }
    func testReverseZero() {
        XCTAssertEqual(try reverse(integer: 0), 0)
    }
    func testToLargeNumberInteger() {
        XCTAssertThrowsError(try reverse(integer: 1234567890123456789))
    }
}
ReverseIntegersTest.defaultTestSuite.run()
