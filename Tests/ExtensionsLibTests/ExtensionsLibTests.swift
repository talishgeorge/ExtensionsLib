import XCTest
@testable import ExtensionsLib

final class ExtensionsLibTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ExtensionsLib().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
