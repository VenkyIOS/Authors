import XCTest
@testable import Authors

final class AuthorsTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Authors().text, "Hello, World!")
    }
}
