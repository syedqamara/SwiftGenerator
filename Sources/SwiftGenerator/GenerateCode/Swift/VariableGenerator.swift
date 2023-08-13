//
//  File.swift
//  
//
//  Created by Apple on 10/08/2023.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftExtractor
import Dependencies


public class VariableCodeGenerator: CodeGenerator<Variable,VariableDeclSyntax> {
    public override func generate(_ input: Variable) -> VariableDeclSyntax {
        switch input.declarationType {
        case .let:
            return LetGenerator().generate(input)
        case .var:
            return VarGenerator().generate(input)
        }
    }
}

public class LetVariableCodeGenerator: CodeGenerator<Variable, VariableDeclSyntax> {
    @Dependency(\.variablePatternGenerator) var patternGenerator
    public override func generate(_ input: Variable) -> VariableDeclSyntax {
        let pattern = patternGenerator.generate(input)
        var variable = VariableDeclSyntax(
            letOrVarKeyword: .letKeyword(trailingTrivia: .space),
            bindings: PatternBindingListSyntax([
                pattern
            ])
        )
        variable.modifiers = .init(arrayLiteral: .init(name: .unknown(input.accessModifier.rawValue, trailingTrivia: .space)))
        return variable
    }
}

public class VarVariableCodeGenerator: CodeGenerator<Variable, VariableDeclSyntax> {
    @Dependency(\.variablePatternGenerator) var patternGenerator
    public override func generate(_ input: Variable) -> VariableDeclSyntax {
        let pattern = patternGenerator.generate(input)
        var variable = VariableDeclSyntax(
            letOrVarKeyword: .varKeyword(trailingTrivia: .space),
            bindings: PatternBindingListSyntax([
                pattern
            ])
        )
        variable.modifiers = .init(arrayLiteral: .init(name: .unknown(input.accessModifier.rawValue, trailingTrivia: .space)))
        return variable
    }
}

public class VariablePatternCodeGenerator: CodeGenerator<Variable, PatternBindingSyntax> {
    public override func generate(_ input: Variable) -> PatternBindingSyntax {
        let namePatternSyntax = PatternSyntax(stringLiteral: input.name)
        var typePatternSyntax = TypeSyntax(stringLiteral: input.kind.propertyTypeString)
        typePatternSyntax.leadingTrivia = .space
        let pattern = PatternBindingSyntax(pattern: namePatternSyntax, typeAnnotation: TypeAnnotationSyntax(type: typePatternSyntax))
        return pattern
    }
}
