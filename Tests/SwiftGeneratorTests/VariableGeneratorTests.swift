import XCTest
import Dependencies
import SwiftExtractor
@testable import SwiftGenerator



final class VariableGeneratorTests: XCTestCase {
    @Dependency(\.variableGenerator) var generator
    // MARK: Public Variables
    // Var Variables
    func testPublicVarVariables() throws {
        let variable = makeVariable(access: .public, keyword: .var, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .public, keyword: .var, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "public var id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "public var name: String?")
    }
    // Let Variables
    func testPublicLetVariables() throws {
        let variable = makeVariable(access: .public, keyword: .let, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .public, keyword: .let, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "public let id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "public let name: String?")
    }
    // MARK: Private Variables
    // Var Variables
    func testPrivateVarVariables() throws {
        let variable = makeVariable(access: .private, keyword: .var, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .private, keyword: .var, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "private var id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "private var name: String?")
    }
    // Let Variables
    func testPrivateLetVariables() throws {
        let variable = makeVariable(access: .private, keyword: .let, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .private, keyword: .let, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "private let id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "private let name: String?")
    }
    // MARK: Open Variables
    // Var Variables
    func testOpenVarVariables() throws {
        let variable = makeVariable(access: .open, keyword: .var, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .open, keyword: .var, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "open var id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "open var name: String?")
    }
    // Let Variables
    func testOpenLetVariables() throws {
        let variable = makeVariable(access: .open, keyword: .let, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .open, keyword: .let, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "open let id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "open let name: String?")
    }
    // MARK: Internal Variables
    // Var Variables
    func testInternalVarVariables() throws {
        let variable = makeVariable(access: .internal, keyword: .var, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .internal, keyword: .var, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "internal var id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "internal var name: String?")
    }
    // Let Variables
    func testInternalLetVariables() throws {
        let variable = makeVariable(access: .internal, keyword: .let, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .internal, keyword: .let, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "internal let id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "internal let name: String?")
    }
    // MARK: FilePrivate Variables
    // Var Variables
    func testFilePrivateVarVariables() throws {
        let variable = makeVariable(access: .filePrivate, keyword: .var, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .filePrivate, keyword: .var, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "fileprivate var id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "fileprivate var name: String?")
    }
    // Let Variables
    func testFilePrivateLetVariables() throws {
        let variable = makeVariable(access: .filePrivate, keyword: .let, name: "id", type: "Int")
        let variableOptional = makeVariable(access: .filePrivate, keyword: .let, name: "name", type: "String", isOptional: true)
        XCTAssertTrue(generator.generate(variable).description == "fileprivate let id: Int")
        XCTAssertTrue(generator.generate(variableOptional).description == "fileprivate let name: String?")
    }
    
    func makeVariable(access: AccessModifiers = .internal, keyword: PropertyDeclarationType, name: String, type: String, isOptional: Bool = false) -> Variable {
        Variable(
            url: .default,
            accessModifier: access,
            declarationType: keyword,
            name: name,
            kind: .init(url: .default, name: type, constraint: .none, isOptional: isOptional),
            declatationSyntax: nil
        )
    }
}
