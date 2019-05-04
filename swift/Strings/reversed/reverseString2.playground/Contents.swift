import UIKit
import XCTest


func reverse(_ str: String? = nil) -> String?
{
    guard str != nil else {return nil}
    var result = ""
    for char in str!.reversed() {
        result += String(char)
    }
    return result
}


class StringReverseTests: XCTestCase {
 
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    func testReverseFunctionExists() {
        XCTAssertEqual(reverse(), nil)
    }
    
    func testReverse_reverses_a_string_abcd() {
        XCTAssertEqual(reverse("abcd"),"dcba");
    }

    func testReverse_reverses_a_string___abcd_to_dcba____() {
        XCTAssertEqual(reverse("  abcd"),"dcba  ");
    };
    
    func testReverseGreetings() {
        XCTAssertEqual(reverse("Greetings!"), "!sgniteerG")
    }
}
StringReverseTests.defaultTestSuite.run()
