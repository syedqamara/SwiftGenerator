import XCTest
import Dependencies
import SwiftExtractor
@testable import SwiftGenerator



final class VariableGeneratorTests: BaseGeneratorTests {
    @Dependency(\.variableGenerator) var generator
    // MARK: Open Variables
    func testOpenVariables() throws {
        let varVariable = Variable.openVarVariable()
        let varVariableOptional = Variable.openVarVariableOptional()
        let letVariable = Variable.openLetVariable()
        let letVariableOptional = Variable.openLetVariableOptional()
        self.testGenerators(
            generator: generator,
            input: [
                letVariable,
                varVariable,
                letVariableOptional,
                varVariableOptional
            ]
        )
    }
    // MARK: Public Variables
    func testPublicVariables() throws {
        let varVariable = Variable.publicVarVariable()
        let varVariableOptional = Variable.publicVarVariableOptional()
        let letVariable = Variable.publicLetVariable()
        let letVariableOptional = Variable.publicLetVariableOptional()
        self.testGenerators(
            generator: generator,
            input: [
                letVariable,
                varVariable,
                letVariableOptional,
                varVariableOptional
            ]
        )
    }
    // MARK: Internal Variables
    func testInternalVariables() throws {
        let varVariable = Variable.internalVarVariable()
        let varVariableOptional = Variable.internalVarVariableOptional()
        let letVariable = Variable.privateLetVariable()
        let letVariableOptional = Variable.internalLetVariableOptional()
        self.testGenerators(
            generator: generator,
            input: [
                letVariable,
                varVariable,
                letVariableOptional,
                varVariableOptional
            ]
        )
    }
    // MARK: Private Variables
    func testPrivateVariables() throws {
        let varVariable = Variable.privateVarVariable()
        let varVariableOptional = Variable.privateVarVariableOptional()
        let letVariable = Variable.privateLetVariable()
        let letVariableOptional = Variable.privateLetVariableOptional()
        self.testGenerators(
            generator: generator,
            input: [
                letVariable,
                varVariable,
                letVariableOptional,
                varVariableOptional
            ]
        )
    }
    // MARK: File Private Variables
    func testFilePrivateVariables() throws {
        let varVariable = Variable.fileprivateVarVariable()
        let varVariableOptional = Variable.fileprivateVarVariableOptional()
        let letVariable = Variable.fileprivateLetVariable()
        let letVariableOptional = Variable.fileprivateLetVariableOptional()
        self.testGenerators(
            generator: generator,
            input: [
                letVariable,
                varVariable,
                letVariableOptional,
                varVariableOptional
            ]
        )
    }
    
    
}
