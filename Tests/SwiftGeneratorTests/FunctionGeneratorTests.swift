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

final class FunctionGeneratorTests: XCTestCase {
    @Dependency(\.functionGenerator) private var functionGenerator
    func testSimpleFunction() throws {
        let function = Function(
            url: .default,
            name: "calculate",
            return: .type(name: "Double"),
            accessModifier: .public,
            parameters: [
                .init(
                    url: .default,
                    name: "value1",
                    property: .property(name: "", type: "Double")
                ),
                .init(
                    url: .default,
                    name: "value2",
                    property: .property(name: "", type: "Double")
                ),
                .init(
                    url: .default,
                    name: "sign",
                    property: .property(name: "", type: "Sign")
                ),
            ],
            declatationSyntax: nil,
            generics: []
        )
        let functionSyntax = functionGenerator.generate(function)
        print("------------------------------------")
        print("\(functionSyntax.description)")
        print("------------------------------------")
        
    }
}
