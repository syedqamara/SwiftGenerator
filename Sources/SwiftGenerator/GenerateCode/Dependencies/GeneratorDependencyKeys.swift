//
//  File.swift
//  
//
//  Created by Apple on 10/08/2023.
//

import Foundation
import Dependencies
import SwiftExtractor

// MARK: - Var Variable Generator Dependencies

extension VarGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: VarVariableCodeGenerator { .init() }
    public static var previewValue: VarVariableCodeGenerator { .init() }
    public static var liveValue: VarVariableCodeGenerator { .init() }
}
// MARK: - Let Variable Generator Dependencies

extension LetGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: LetVariableCodeGenerator { .init() }
    public static var previewValue: LetVariableCodeGenerator { .init() }
    public static var liveValue: LetVariableCodeGenerator { .init() }
}
// MARK: - Variable Generator Dependencies

extension VariableGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: VariableCodeGenerator { .init() }
    public static var previewValue: VariableCodeGenerator { .init() }
    public static var liveValue: VariableCodeGenerator { .init() }
}

// MARK: - Variable Pattern Generator Dependencies

extension PatternGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: VariablePatternCodeGenerator { .init() }
    public static var previewValue: VariablePatternCodeGenerator { .init() }
    public static var liveValue: VariablePatternCodeGenerator { .init() }
}

// MARK: - Function Parameter Generator Dependencies

extension ParameterGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: ParameterGenerator { .init() }
    public static var previewValue: ParameterGenerator { .init() }
    public static var liveValue: ParameterGenerator { .init() }
}

// MARK: - Function Parameter Generator Dependencies

extension ParametersGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: ParametersGenerator { .init() }
    public static var previewValue: ParametersGenerator { .init() }
    public static var liveValue: ParametersGenerator { .init() }
}

// MARK: - Function Return Type Generator Dependencies

extension ReturnTypeGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: ReturnTypeGenerator { .init() }
    public static var previewValue: ReturnTypeGenerator { .init() }
    public static var liveValue: ReturnTypeGenerator { .init() }
}

// MARK: - Function Generator Dependencies

extension FunctionGenerator: TestDependencyKey, DependencyKey {
    public static var testValue: FunctionGenerator { .init() }
    public static var previewValue: FunctionGenerator { .init() }
    public static var liveValue: FunctionGenerator { .init() }
}
