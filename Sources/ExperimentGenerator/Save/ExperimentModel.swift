//
//  File.swift
//  
//
//  Created by Apple on 06/08/2023.
//

import Foundation

protocol Experimenting: Codable {
    associatedtype CodingKeys: (CodingKey & CaseIterable)
    var id: String { get }
    var type: String { get }
    var defaultValue: String { get }
    var info: String { get }
    func getKey(keyPath: PartialKeyPath<Experiment>) -> String
    func getValue(keyPath: KeyPath<Self, String>) -> String
}

struct Experiment: Experimenting {
    var id: String
    var type: String
    var defaultValue: String
    var info: String
    func getKey(keyPath: PartialKeyPath<Experiment>) -> String {
        return String(describing: keyPath.self)
    }
    func getValue(keyPath: KeyPath<Experiment, String>) -> String {
        self[keyPath: keyPath]
    }
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id = "id"
        case type = "type"
        case defaultValue = "default_value"
        case info = "info"
    }
}

class FileLoader {
    private var url: URL
    init(url: URL) {
        self.url = url
    }
}
extension FileLoader {
    func loadExperiments<E: Experimenting>(_ experimentType: E.Type) throws -> [String: E] {
        let jsonData = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([String: E].self, from: jsonData)
    }
}
