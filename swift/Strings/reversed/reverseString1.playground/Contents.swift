import UIKit
import XCTest


func reverse(_ str: String = "") -> String
{
    return String(str.reversed())
}


class StringReverseTests: XCTestCase {
 
    var string: String?
    
    override func setUp() {
        super.setUp()
        string = "String"
    }
    
    override func tearDown() {
        string = nil
        super.tearDown()
    }
    
    func testReverseFunctionExists() {
        XCTAssertNotNil(reverse())
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
