//
//  File.swift
//  
//
//  Created by Apple on 10/08/2023.
//

import Foundation
import SwiftExtractor
import Dependencies

extension DependencyValues {
    public var variableGenerator: VariableGenerator {
        get { self[VariableGenerator.self] }
        set { self[VariableGenerator.self] = newValue }
    }
    public var letVariableGenerator: LetGenerator {
        get { self[LetGenerator.self] }
        set { self[LetGenerator.self] = newValue }
    }
    public var varVariableGenerator: VarGenerator {
        get { self[VarGenerator.self] }
        set { self[VarGenerator.self] = newValue }
    }
    public var variablePatternGenerator: PatternGenerator {
        get { self[PatternGenerator.self] }
        set { self[PatternGenerator.self] = newValue }
    }
    public var parameterGenerator: ParameterGenerator {
        get { self[ParameterGenerator.self] }
        set { self[ParameterGenerator.self] = newValue }
    }
    public var parametersGenerator: ParametersGenerator {
        get { self[ParametersGenerator.self] }
        set { self[ParametersGenerator.self] = newValue }
    }
    public var returnTypeGenerator: ReturnTypeGenerator {
        get { self[ReturnTypeGenerator.self] }
        set { self[ReturnTypeGenerator.self] = newValue }
    }
    public var functionGenerator: FunctionGenerator {
        get { self[FunctionGenerator.self] }
        set { self[FunctionGenerator.self] = newValue }
    }
}
