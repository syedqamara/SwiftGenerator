//
//  File.swift
//  
//
//  Created by Apple on 16/08/2023.
//

import Foundation
import XCTest
import Dependencies
import SwiftExtractor
@testable import SwiftGenerator

final class ClassGeneratorTest: BaseGeneratorTests {
    @Dependency(\.classGenerator) var generator
    func testSimpleClass() throws {
        let testData = Swift.simpleClass()
        testGenerator(
            generator: generator,
            input: testData
        )
    }
}
