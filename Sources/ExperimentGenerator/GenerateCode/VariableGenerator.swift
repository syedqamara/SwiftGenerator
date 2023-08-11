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


public class VariableCodeGenerator: CodeGenerator<Swift.Property,VariableDeclSyntax> {
    public override func generate(_ input: Swift.Property) -> VariableDeclSyntax {
        LetGenerator().generate(input)
    }
}

public class LetVariableCodeGenerator: CodeGenerator<Swift.Property, VariableDeclSyntax> {
    public override func generate(_ input: Swift.Property) -> VariableDeclSyntax {
        let namePatternSyntax = PatternSyntax(stringLiteral: input.name)
        let typePatternSyntax = TypeSyntax(stringLiteral: input.propertyTypeString)
        let pattern = PatternBindingSyntax(pattern: namePatternSyntax, typeAnnotation: TypeAnnotationSyntax(type: typePatternSyntax))
        
        let variable = VariableDeclSyntax(
            letOrVarKeyword: .let,
            bindings: PatternBindingListSyntax([
                pattern
            ])
        )
        return variable
    }
}

public class VarVariableCodeGenerator: CodeGenerator<Swift.Property, VariableDeclSyntax> {
    @Dependency(\.variablePatternGenerator) var patternGenerator
    public override func generate(_ input: Swift.Property) -> VariableDeclSyntax {
        let pattern = patternGenerator.generate(input)
        let variable = VariableDeclSyntax(
            letOrVarKeyword: .var,
            bindings: PatternBindingListSyntax([
                pattern
            ])
        )
        return variable
    }
}

public class VariablePatternCodeGenerator: CodeGenerator<Swift.Property, PatternBindingSyntax> {
    public override func generate(_ input: Swift.Property) -> PatternBindingSyntax {
        let namePatternSyntax = PatternSyntax(stringLiteral: input.name)
        let typePatternSyntax = TypeSyntax(stringLiteral: input.propertyTypeString)
        let pattern = PatternBindingSyntax(pattern: namePatternSyntax, typeAnnotation: TypeAnnotationSyntax(type: typePatternSyntax))
        return pattern
    }
}
