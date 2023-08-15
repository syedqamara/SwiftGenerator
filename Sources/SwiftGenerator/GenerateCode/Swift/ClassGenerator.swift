//
//  ClassGenerator.swift
//  
//
//  Created by Apple on 16/08/2023.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftExtractor
import Dependencies

public class ClassCodeGenerator: CodeGenerator<Swift, ClassDeclSyntax> {
    @Dependency(\.functionGenerator) private var functionGenerator
    @Dependency(\.variableGenerator) private var variableGenerator
    public override func generate(_ input: Swift) -> ClassDeclSyntax {
        ClassDeclSyntax(
            classKeyword: .classKeyword(trailingTrivia: .space),
            identifier: .identifier(input.reference.name, trailingTrivia: .space),
            members: .init(
                members: members(input.reference),
                rightBrace: .rightBraceToken(leadingTrivia: .newline + .zero)
            )
        )
    }
    func functions(_ input: InterfaceType) -> [MemberDeclListSyntax.Element] {
        return input.functions.map {
            .init(leadingTrivia: .newCode, decl: functionGenerator.generate($0))
        }
    }
    func variables(_ input: InterfaceType) -> [MemberDeclListSyntax.Element] {
        return input.attributes.map {
            .init(leadingTrivia: .newCode, decl: variableGenerator.generate($0))
        }
    }
    func members(_ input: InterfaceType) -> MemberDeclListSyntax {
        let members =  variables(input) + functions(input)
        
        return .init(members)
    }
}
