//
//  File.swift
//  
//
//  Created by Apple on 16/08/2023.
//

import Foundation
import SwiftExtractor
@testable import SwiftGenerator

extension Variable {
    static func makeVariable(access: AccessModifiers = .internal, keyword: PropertyDeclarationType, name: String, type: String, isOptional: Bool = false) -> GeneratorTestInput<Self> {
        let variable = Variable(
            url: .default,
            accessModifier: access,
            declarationType: keyword,
            name: name,
            kind: .init(url: .default, name: type, constraint: .none, isOptional: isOptional),
            declatationSyntax: nil
        )
        let description = makeCode(variable: variable, keyword: keyword)
        return .init(source: variable, code: description)
    }
    private static func makeCode(variable: Variable, keyword: PropertyDeclarationType) -> String {
        return "\(variable.accessModifier.rawValue) \(keyword.rawValue) \(variable.name): \(variable.kind.propertyTypeString)"
    }
    // MARK: - Private Variables
    static func privateLetVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .private,
            keyword: .let,
            name: "id",
            type: "Int"
        )
    }
    static func privateVarVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .private,
            keyword: .var,
            name: "id",
            type: "Int"
        )
    }
    static func privateLetVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .private,
            keyword: .let,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    static func privateVarVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .private,
            keyword: .var,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    // MARK: - Public Variables
    static func publicLetVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .public,
            keyword: .let,
            name: "id",
            type: "Int"
        )
    }
    static func publicVarVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .public,
            keyword: .var,
            name: "id",
            type: "Int"
        )
    }
    static func publicLetVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .public,
            keyword: .let,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    static func publicVarVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .public,
            keyword: .var,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    // MARK: - Internal Variables
    static func internalLetVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .internal,
            keyword: .let,
            name: "id",
            type: "Int"
        )
    }
    static func internalVarVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .internal,
            keyword: .var,
            name: "id",
            type: "Int"
        )
    }
    static func internalLetVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .internal,
            keyword: .let,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    static func internalVarVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .internal,
            keyword: .var,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    // MARK: - Open Variables
    static func openLetVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .open,
            keyword: .let,
            name: "id",
            type: "Int"
        )
    }
    static func openVarVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .open,
            keyword: .var,
            name: "id",
            type: "Int"
        )
    }
    static func openLetVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .open,
            keyword: .let,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    static func openVarVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .open,
            keyword: .var,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    // MARK: - FilePrivate Variables
    static func fileprivateLetVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .filePrivate,
            keyword: .let,
            name: "id",
            type: "Int"
        )
    }
    static func fileprivateVarVariable() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .filePrivate,
            keyword: .var,
            name: "id",
            type: "Int"
        )
    }
    static func fileprivateLetVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .filePrivate,
            keyword: .let,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
    static func fileprivateVarVariableOptional() -> GeneratorTestInput<Self> {
        makeVariable(
            access: .filePrivate,
            keyword: .var,
            name: "id",
            type: "Int",
            isOptional: true
        )
    }
}
