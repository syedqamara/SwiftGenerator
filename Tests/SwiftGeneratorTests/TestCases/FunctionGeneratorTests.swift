//
//  FunctionGeneratorTests.swift
//  
//
//  Created by Apple on 13/08/2023.
//

import Foundation
import XCTest
import Dependencies
import SwiftExtractor
@testable import SwiftGenerator

final class FunctionGeneratorTests: BaseGeneratorTests {
    @Dependency(\.functionGenerator) private var functionGenerator
    // MARK: Test Open Functions
    func testOpenFunction() throws {
        let main = Function.mainFunction(accessModifire: .open)
        let calculate = Function.calculateFunction(accessModifire: .open)
        testGenerators(
            generator: functionGenerator,
            input: [main, calculate]
        )
    }
    // MARK: Test Public Functions
    func testPublicFunction() throws {
        let main = Function.mainFunction()
        let calculate = Function.calculateFunction()
        testGenerators(
            generator: functionGenerator,
            input: [main, calculate]
        )
    }
    // MARK: Test Internal Functions
    func testInternalFunction() throws {
        let main = Function.mainFunction(accessModifire: .internal)
        let calculate = Function.calculateFunction(accessModifire: .internal)
        testGenerators(
            generator: functionGenerator,
            input: [main, calculate]
        )
    }
    // MARK: Test Private Functions
    func testPrivateFunction() throws {
        let main = Function.mainFunction(accessModifire: .private)
        let calculate = Function.calculateFunction(accessModifire: .private)
        testGenerators(
            generator: functionGenerator,
            input: [main, calculate]
        )
    }
    // MARK: Test File Private Functions
    func testFilePrivateFunction() throws {
        let main = Function.mainFunction(accessModifire: .filePrivate)
        let calculate = Function.calculateFunction(accessModifire: .filePrivate)
        testGenerators(
            generator: functionGenerator,
            input: [main, calculate]
        )
    }
}
