//
//  File.swift
//  
//
//  Created by Apple on 16/08/2023.
//

import Foundation
import SwiftExtractor
@testable import SwiftGenerator

extension Function {
    static func calculateFunction(accessModifire: _ModifierType_ = .internal) -> GeneratorTestInput<Self> {
        let function = Function(
            url: .default,
            name: "calculate",
            return: .type(name: "Double"),
            accessModifier: accessModifire,
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
        let description = "\(accessModifire.rawValue) func calculate(value1: Double, value2: Double, sign: Sign) -> Double"
        return .init(source: function, code: description)
    }
    static func mainFunction(accessModifire: _ModifierType_ = .internal) -> GeneratorTestInput<Self> {
        let function = Function(
            url: .default,
            name: "main",
            accessModifier: accessModifire,
            parameters: [],
            declatationSyntax: nil,
            generics: []
        )
        let description = "\(accessModifire.rawValue) func main()"
        return .init(source: function, code: description)
    }
}
