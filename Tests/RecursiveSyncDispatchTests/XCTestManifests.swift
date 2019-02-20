import XCTest

extension RecursiveSyncDispatchTests {
    static let __allTests = [
        ("testBasicUsage", testBasicUsage),
        ("testSimpleUsage", testSimpleUsage),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RecursiveSyncDispatchTests.__allTests),
    ]
}
#endif
