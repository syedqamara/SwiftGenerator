import XCTest
@testable import ExperimentGenerator

final class ExperimentGeneratorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        var codeGenerator = SwiftClassGenerator()
        
        codeGenerator.className = "ExampleClass"
        codeGenerator.attributes = [
                (isVar: false, name: "id", type: "UUID", implementations: []),
                (isVar: true, name: "name", type: "String", implementations: []),
                (isVar: true, name: "haveName", type: "String", implementations: [
                    "return !name.isEmpty"
                ])
                ]
        print("::::::Generated -START- Code::::::")
        print(codeGenerator.generate())
        print("::::::Generated -END- Code::::::")
    }
}
