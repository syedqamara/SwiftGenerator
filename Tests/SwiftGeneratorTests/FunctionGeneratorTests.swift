//
//  FunctionGeneratorTests.swift
//  
//
//  Created by Apple on 13/08/2023.
//

import Foundation
import XCTest
import Dependencies
import SwiftExtractor
@testable import SwiftGenerator

final class FunctionGeneratorTests: XCTestCase {
    @Dependency(\.functionGenerator) private var functionGenerator
}
