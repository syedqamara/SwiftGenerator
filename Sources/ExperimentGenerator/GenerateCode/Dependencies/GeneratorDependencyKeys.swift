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
