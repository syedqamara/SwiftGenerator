//
//  File.swift
//  
//
//  Created by Apple on 16/08/2023.
//

import Foundation
import SwiftExtractor
@testable import SwiftGenerator

extension InterfaceType {
    static func classes(accessModifier: AccessModifiers = .internal, name: String) -> GeneratorTestInput<Self> {
        
        let mainFunction = Function.mainFunction(accessModifire: accessModifier)
        let calculateFunction = Function.calculateFunction(accessModifire: accessModifier)
        
        let functionSources = [mainFunction.source, calculateFunction.source]
        let functionCodes = [mainFunction.code, calculateFunction.code].map { "\t"+$0 }.joined(separator: "\n")
        
        let letVariable = Variable.makeVariable(access: accessModifier, keyword: .let, name: "id", type: "Int")
        let letVariableOptional = Variable.makeVariable(access: accessModifier, keyword: .let, name: "id", type: "Int", isOptional: true)
        
        let varVariable = Variable.makeVariable(access: accessModifier, keyword: .var, name: "id", type: "Int")
        let varVariableOptional = Variable.makeVariable(access: accessModifier, keyword: .var, name: "id", type: "Int", isOptional: true)
        
        let variableSources = [letVariable.source, varVariable.source, letVariableOptional.source, varVariableOptional.source]
        let variableCodes =  [letVariable.code, varVariable.code, letVariableOptional.code, varVariableOptional.code].map { "\t"+$0 }.joined(separator: "\n")
        
        let interface = InterfaceType(
            url: .default,
            name: name,
            type: .class,
            access: accessModifier,
            functions: functionSources,
            attributes: variableSources,
            declarationSyntax: .none,
            generics: []
        )
        let code = """
        class \(name) {
        \(variableCodes)
        \(functionCodes)
        }
        """
        return .init(source: interface, code: code)
    }
}

extension Swift {
    static func classes(accessModifier: AccessModifiers = .internal, name: String) -> GeneratorTestInput<Self> {
        let classTestData = InterfaceType.classes(accessModifier: accessModifier, name: name)
        let swift = Swift(
            url: .default,
            name: "",
            packages: [],
            reference: classTestData.source,
            inheritances: [],
            conformance: []
        )
        return .init(source: swift, code: classTestData.code)
    }
    static func simpleClass() -> GeneratorTestInput<Self> {
        return classes(name: "ClassWithProperiesAndFunctions")
    }
}
