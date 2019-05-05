import UIKit
import XCTest

func palindrome(_ str: String = "") -> Bool
{
// in 0.052 sec...
//    var splittedArray:[Character] = [Character]()
//    for char in str { splittedArray.append(char)}
//    for (i, c) in splittedArray.enumerated(){
//        if (c == splittedArray[str.count - i  - 1]) == false { return false}
//    }
//    return true
    
    // in 0.024 sec
    let inverse = String(str.reversed())
    return inverse == str
}

class PalindromeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testPalindromeFunctionExists() {
        XCTAssertNotNil(palindrome())
    }
    func testPalindromeIsFunction() {
        XCTAssertTrue(((String) -> Bool).self == type(of: palindrome))
    }
    func testAbcbaIsPalindrome() {
        XCTAssertTrue(palindrome("abcba"))
    }
    func testAbcdeIsNotPalindrome() {
        XCTAssertFalse(palindrome("abcde"))
    }
    func testNumberIsPalindrome() {
        XCTAssertTrue(palindrome("1001"))
    }
    func testSpaceAbcbaSpaceIsPalindrome() {
        XCTAssertTrue(palindrome(" abcba "))
    }
    func testSpaceAbcbaSpaceIsNotPalindrome() {
        XCTAssertFalse(palindrome(" abcba"))
    }
    func testAbcbaSpaceIsNotPalindrome() {
        XCTAssertFalse(palindrome("abcba "))
    }
    func testFish_hsifIsNotPalindrome() {
        XCTAssertFalse(palindrome("Fish hsif"))
    }
}
PalindromeTest.defaultTestSuite.run()
