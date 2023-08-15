//
//  Extensions+Generator.swift
//
//
//  Created by Apple on 06/08/2023.
//

import Foundation
import SwiftSyntax
import SwiftExtractor

extension URL {
    public var isRemoteURL: Bool {
        self.absoluteString.contains("https://") || self.absoluteString.contains("http://")  || self.absoluteString.contains("ftp://")
    }
    public var isLocalURL: Bool {
        !isRemoteURL
    }
    var filePath: String { absoluteString }
    static let `default` = URL(string: "https://www.google.com")!
}
extension Bool {
    var letOrVar: TokenSyntax {
        if self {
            return .varKeyword()
        }
        return .letKeyword()
    }
}
extension TokenSyntax {
    static var codeLine: TokenSyntax {
        .unknown("", leadingTrivia: .newCode)
    }
}
extension Trivia {
    static var newCode: Trivia {
        .newline + .tabs(1)
    }
}
extension PropertyType {
    var propertyTypeString: String {
        return name + (isOptional ? "?" : "")
    }
    static func type(name: String) -> PropertyType {
        .init(
            url: .default,
            name: name,
            constraint: .none,
            isOptional: false
        )
    }
    static func typeOptional(name: String) -> PropertyType {
        .init(
            url: .default,
            name: name,
            constraint: .none,
            isOptional: true
        )
    }
}
extension ParameterProperty {
    static func property(name: String, type: String) -> Self {
        .init(
            url: .default,
            name: name,
            kind: .type(name: type),
            declatationSyntax: nil
        )
    }
    static func propertyOptional(name: String, type: String) -> Self {
        .init(
            url: .default,
            name: name,
            kind: .typeOptional(name: type),
            declatationSyntax: nil
        )
    }
}


struct User {
    var id: UUID = .init()
    var name: String
}

// MARK: AutoMockable
protocol Auth {
    func login(username: String, password: String) -> User
}

class AuthMock: Auth {
    var isLoginCalledCount: Int = 0
    var isLoginCalled: Bool { isLoginCalledCount > 0 }
    var customLoginImplementation: ((String, String) -> User)!
    init(customLoginImplementation: @escaping (String, String) -> User) {
        self.customLoginImplementation = customLoginImplementation
    }
    func login(username: String, password: String) -> User {
        isLoginCalledCount += 1
        return customLoginImplementation(username, password)
    }
}
