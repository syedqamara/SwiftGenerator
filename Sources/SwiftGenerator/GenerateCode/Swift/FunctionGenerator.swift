//
//  FunctionGenerator.swift
//  
//
//  Created by Apple on 12/08/2023.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftExtractor
import Dependencies

public class FunctionCodeGenerator: CodeGenerator<Function, FunctionDeclSyntax> {
    @Dependency(\.returnTypeGenerator) private var returnTypeGenerator
    @Dependency(\.parametersGenerator) private var parametersGenerator
    public override func generate(_ input: Function) -> FunctionDeclSyntax {
        FunctionDeclSyntax(
            modifiers: .init(arrayLiteral: .init(name: .unknown(input.accessModifier.rawValue, trailingTrivia: .space))),
            identifier: .identifier(input.name),
            signature: FunctionSignatureSyntax(
                input: ParameterClauseSyntax(
                    parameterList: parametersGenerator.generate(input)
                ),
                output: getReturnType(input)
            )
        )
    }
    private func getReturnType(_ input: Function) -> ReturnClauseSyntax? {
        if let returnType = input.return {
            return returnTypeGenerator.generate(returnType)
        }
        return nil
    }
}
public class FunctionParameterCodeGenerator: CodeGenerator<Parameter, FunctionParameterSyntax> {
    public override func generate(_ input: Parameter) -> FunctionParameterSyntax {
        FunctionParameterSyntax(
            firstName: Token.identifier(input.name),
            secondName: Token.identifier(input.property.name),
            colon: .colonToken(leadingTrivia: .space),
            type: TypeSyntax(stringLiteral: input.property.kind.propertyTypeString)
        )
    }
}
public class FunctionParametersCodeGenerator: CodeGenerator<Function, FunctionParameterListSyntax> {
    @Dependency(\.parameterGenerator) private var parameterGenerator
    public override func generate(_ input: Function) -> FunctionParameterListSyntax {
        let parameters = input.parameters.map { parameterGenerator.generate($0) }
        return FunctionParameterListSyntax(parameters)
    }
}
public class FunctionReturnTypeCodeGenerator: CodeGenerator<PropertyType, ReturnClauseSyntax> {
    @Dependency(\.parameterGenerator) private var parameterGenerator
    public override func generate(_ input: PropertyType) -> ReturnClauseSyntax {
        ReturnClauseSyntax(
            returnType: TypeSyntax(stringLiteral:  input.propertyTypeString)
        )
    }
}
