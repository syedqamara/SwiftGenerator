//
//  File.swift
//  
//
//  Created by Apple on 09/08/2023.
//

import SwiftSyntax
import SwiftSyntaxBuilder


class ExperimentCodeGenerator<E: Experimenting> {
    
}


public class SwiftClassGenerator {
    var className: String = ""
    var attributes: [(isVar: Bool, name: String, type: String, implementations: [String])] = []
    //    var functions: [(name: String, parameters: [(name: String, type: String)], returnType: String)]
    //    var initializers: [([(name: String, type: String)])]
    //    var inheritance: String?
    
    func generate() -> String {
        
        let properties = attributes.map { isVar, name, type, implementations in
            
            var variable = VariableDeclSyntax(
                isVar.letOrVar,
                name: IdentifierPattern(identifier: .identifier(name, leadingTrivia: .unexpectedText(" "))),
                type: TypeAnnotationSyntax(
                    colon: .colon,
                    type: SimpleTypeIdentifierSyntax(name: .identifier(type, leadingTrivia: .unexpectedText(" "), trailingTrivia: .newline))
                ),
                initializer: nil
            )
            if implementations.isNotEmpty {
                variable = VariableDecl(
                    name: IdentifierPattern(identifier: .identifier(name, leadingTrivia: .unexpectedText(" "))),
                    type: TypeAnnotationSyntax(
                        colon: .colon,
                        type: SimpleTypeIdentifierSyntax(name: .identifier(type, leadingTrivia: .unexpectedText(" ")))
                    ),
                    accessor: codeBlockItemList(implementations: implementations)
                )
            }
            return variable
        }
        let memberProperties = properties.map { MemberDeclListSyntax.Element(decl: $0) }
        let classRef = ClassDeclSyntax(
            identifier: .identifier(className, leadingTrivia: .unexpectedText(" "), trailingTrivia: .unexpectedText("\n")),
            members: .init(members: .init(memberProperties))
        )
        return classRef.description
    }
    func codeBlockItemList(implementations: [String]) -> (() -> CodeBlockItemList) {
        if implementations.isNotEmpty {
            return {
                if implementations.isNotEmpty {
                    return CodeBlockItemList(implementations.map { CodeBlockItemSyntax(item: .stmt(.init(stringLiteral: $0))) })
                }else {
                    return []
                }
            }
        }
        return { .init([]) }
    }
}

public class SwiftClassGeneratorV2 {
    var className: String = ""
    var attributes: [(isVar: Bool, name: String, type: String, implementations: [String])] = []

    // ...

    func generate() -> String {
        let properties = attributes.map { isVar, name, type, implementations in
            var variable: VariableDeclSyntax

            if implementations.isNotEmpty {
                variable = VariableDecl(
                    name: IdentifierPattern(
                        identifier: .identifier(name, leadingTrivia: .space)
                    ),
                    type: TypeAnnotationSyntax(
                        colon: .colon,
                        type: SimpleTypeIdentifierSyntax(
                            name: .identifier(
                                type,
                                leadingTrivia: .space,
                                trailingTrivia: .newline
                            )
                        )
                    ),
                    accessor: codeBlockItemList(implementations: implementations)
                )
            } else {
                variable = VariableDeclSyntax(
                    isVar.letOrVar,
                    name: IdentifierPattern(
                        identifier: .identifier(name, leadingTrivia: .space)
                    ),
                    type: TypeAnnotationSyntax(
                        colon: .colon,
                        type: SimpleTypeIdentifierSyntax(
                            name: .identifier(
                                type,
                                leadingTrivia: .space,
                                trailingTrivia: .newline
                            )
                        )
                    ),
                    initializer: nil
                )
            }
            
            return variable
        }

        let memberProperties = properties.map { MemberDeclListSyntax.Element(decl: $0) }

        let classRef = ClassDeclSyntax(
            identifier: .identifier(className, leadingTrivia: .unexpectedText(" "), trailingTrivia: .unexpectedText("\n")),
            members: .init(members: .init(memberProperties))
        )

        return classRef.description
    }

    func codeBlockItemList(implementations: [String]) -> (() -> CodeBlockItemList) {
        if implementations.isNotEmpty {
            return {
                CodeBlockItemList(implementations.map { CodeBlockItemSyntax(item: .stmt(.init(stringLiteral: $0))) })
            }
        }
        
        return { .init([]) }
    }
}
