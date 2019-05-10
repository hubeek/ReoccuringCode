import UIKit

import XCTest
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
func chunkArray(arr: [Int], size: Int) -> [[Int]] {
    var result:[[Int]] = []
    result  = stride(from: 0, to: arr.count, by: size).map{
        Array(arr[$0 ..< min($0+size, arr.count)])
    }
    return result
}
let numbers = Array(1...12)
chunkArray(arr: numbers, size: 4)

class ChunkArrayTest: XCTestCase {
    var numbers:[Int]?
    
    override func setUp() {
        super.setUp()
        numbers = Array(1...12)
    }
    override func tearDown() {
        numbers = nil
        super.tearDown()
    }
    func testChunkInPartsOf4() {
        XCTAssertEqual(chunkArray(arr: numbers!, size: 4).count, 3)
        XCTAssertEqual(chunkArray(arr: numbers!, size: 4).first, [1,2,3,4])
        XCTAssertEqual(numbers!.chunked(into: 4).count, 3)
        XCTAssertEqual(numbers!.chunked(into: 4).first!, [1,2,3,4])
    }
    func testChunkInPartsOf3() {
        XCTAssertEqual(chunkArray(arr: numbers!, size: 3).count, 4)
        XCTAssertEqual(numbers!.chunked(into: 3).count, 4)
    }
    func testChunkInPartsOf5() {
        XCTAssertEqual(chunkArray(arr: numbers!, size: 5).count, 3)
        XCTAssertEqual(numbers!.chunked(into: 5).count, 3)
        XCTAssertEqual(chunkArray(arr: numbers!, size: 5), [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10], [11, 12]])
        
    }
    func testChunkInPartsOf7() {
        XCTAssertEqual(chunkArray(arr: numbers!, size: 7).count, 2)
        XCTAssertEqual(numbers!.chunked(into: 7).count, 2)
    }
    func testChunkInPartsOfOne() {
        numbers = [1,2,3]
        XCTAssertEqual(chunkArray(arr: numbers!, size: 1), [[1],[2],[3]])
        XCTAssertEqual(numbers!.chunked(into: 1), [[1],[2],[3]])
    }
}
ChunkArrayTest.defaultTestSuite.run()
