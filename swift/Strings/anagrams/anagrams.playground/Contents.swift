import UIKit
import XCTest

extension String {
    func anagrams(with string2: String) -> Bool {
        return cleanStringInParts(string: self) == cleanStringInParts(string: string2)
    }
}
func anagrams(_ string1: String,_ string2: String) -> Bool {
    return cleanStringInParts(string: string1) == cleanStringInParts(string: string2)
}

func cleanStringInParts(string:String) -> [String] {
    var result:[String] = []
    for char in string.lowercased() {
        result.append("\(char)")
    }
    result = result.sorted(by: { (a, b) -> Bool in
        a < b
    })
    result
    return result
}

class AnagramsTest: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    func testAnagramOfRailSafety() {
        XCTAssertEqual(anagrams("rail safety", "fairy tales"), true)
        XCTAssertEqual("rail safety".anagrams(with: "fairy tales"), true)
    }
    func testHello()
    {
        XCTAssertEqual(anagrams("Hello", "loHle"), true)
        XCTAssertEqual("Hello".anagrams(with: "loHle"), true)
    }
    func testOneOne() {
        XCTAssertEqual(anagrams("One One One", "two two two"), false)
        XCTAssertEqual("One One One".anagrams(with: "two two two"), false)
    }
    func testWhoa() {
        XCTAssertEqual(anagrams("Whoa! Hi!", "Whoa! Hi!"), true)
        XCTAssertEqual("Whoa! Hi!".anagrams(with: "Whoa! Hi!"), true)
    }
}

AnagramsTest.defaultTestSuite.run()
