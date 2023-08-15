//
//  BaseGeneratorTests.swift
//  
//
//  Created by Apple on 16/08/2023.
//

import Foundation
import XCTest
import Dependencies
import SwiftExtractor
import SwiftSyntax
@testable import SwiftGenerator

public struct GeneratorTestInput<S: Sourcable> {
    public var source: S
    public var code: String
    public init(source: S, code: String) {
        self.source = source
        self.code = code
    }
}

class BaseGeneratorTests: XCTestCase {
    func testGenerator<G: CodeGeneratable>(generator: G, input: GeneratorTestInput<G.Input>) {
        let syntax = generator.generate(input.source)
        print("<--- Code Generated --->")
        print("")
        print("\(syntax.description)")
        print("")
        print("")
        print("\(input.code)")
        print("")
        print("<------------------------------------>")
        XCTAssertTrue(syntax.description == input.code, "Code generate did not match with the expected one")
    }
    func testGenerators<G: CodeGeneratable>(generator: G, input: [GeneratorTestInput<G.Input>]) {
        input.forEach { [generator] inp in
            testGenerator(
                generator: generator,
                input: inp
            )
        }
    }
}
