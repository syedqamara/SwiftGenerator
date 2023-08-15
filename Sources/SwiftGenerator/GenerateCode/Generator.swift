//
//  File.swift
//  
//
//  Created by Apple on 06/08/2023.
//

import Foundation
import core_architecture
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftExtractor
import Dependencies

public protocol CodeGeneratable: IOProtocol where Output: SyntaxProtocol {
    init()
    func generate(_ input: Input) -> Output
}

public class CodeGenerator<I: Sourcable, O: SyntaxProtocol>: CodeGeneratable {
    public typealias Input = I
    public typealias Output = O
    required public init() {}
    public func generate(_ input: I) -> O {
        fatalError("Override: \(#function)")
    }
}




