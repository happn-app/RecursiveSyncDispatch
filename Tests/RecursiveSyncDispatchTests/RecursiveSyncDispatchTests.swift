import XCTest
@testable import RecursiveSyncDispatch

final class RecursiveSyncDispatchTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(RecursiveSyncDispatch().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
