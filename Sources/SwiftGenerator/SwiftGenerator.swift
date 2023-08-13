import Foundation
//import Yams

@main
public struct SwiftGenerator {
    private var fileLoader: FileLoader?
    private var fileSaver: FileSaver<FileData>?
    
    public static func main() {
        guard CommandLine.arguments.count > 2 else {
            print("Usage: ./script.swift <path-to-yaml-file> <path-to-swift-generated-file>")
            exit(1)
        }
        let fileLoader = FileLoader(url: URL(fileURLWithPath: CommandLine.arguments[1]))
        
        
//
//        // Decodable struct for YAML data
//        struct ExperimentConfig: Decodable {
//            let id: String
//            let type: String
//            let defaultValue: String
//            let info: String
//        }
//
//        // Struct for ExperimentKey
//        struct ExperimentKey: Decodable {
//            typealias KeyType = String
//            var key: String
//        }
//
//        // Function to convert ExperimentConfig to ExperimentValue
//        func experimentValue(config: ExperimentConfig, forKey: String) -> String {
//            let typeStr = "ExperimentValue<\(config.type.capitalFirst)>"
//            var defaultValueStr = "\(config.defaultValue)"
//
//
//            if config.type == "string" {
//                defaultValueStr = "\"\(defaultValueStr)\""
//            }
//
//            return "\(typeStr){ \(typeStr)(id: .\(forKey)Key, type: .\(config.type), defaultValue: \(defaultValueStr), info: \"\(config.info)\") }"
//        }
//
//        // Read YAML data from file
//        guard let yamlData = try? String(contentsOf: fileURL, encoding: .utf8) else {
//            print("Error reading YAML data from the file.")
//            exit(1)
//        }
//
//        // Decode YAML data into ExperimentConfig dictionary
//        let decoder = YAMLDecoder()
//        let experimentsDict = try! decoder.decode([String: ExperimentConfig].self, from: Data(yamlData.utf8))
//
//        // Generate ExperimentKey extensions
//        var keysOutput = ""
//        keysOutput += "extension ExperimentKey {\n"
//        for (key, value) in experimentsDict {
//            keysOutput += "    static var \(key)Key: ExperimentKey { ExperimentKey(key: \"\(value.id)\") }\n"
//        }
//        keysOutput += "}\n\n"
//        // Generate ExperimentValue extensions
//        var valuesOutput = ""
//        valuesOutput += "extension ExperimentValue {\n"
//        for (key, config) in experimentsDict {
//            valuesOutput += "    static var \(key): \(experimentValue(config: config, forKey: key))\n"
//        }
//        valuesOutput += "}\n\n"
//        // Final output
//        let output = keysOutput + valuesOutput
//
//        if #available(macOS 13.0, *) {
//            writingFilePath = writingFilePath.appending(path: "ExperimentsGenerated.swift")
//        } else {
//            writingFilePath = writingFilePath.appendingPathComponent("ExperimentsGenerated.swift")
//        }
//
//        // Writing the output to a file
//        let outputPath = writingFilePath.relativePath
//        do {
//            try output.write(toFile: outputPath, atomically: true, encoding: .utf8)
//            print("Experiments generated successfully and saved to \(outputPath)")
//        } catch {
//            print("Error while writing to file: \(error)")
//        }
    }
    static func save(url: URL, data: Data) async {
        let fileSaver = FileSaver<FileData>(
            input: FileData(
                url: url,
                data: data,
                shouldReplace: false
            )!
        )
        let save = await fileSaver.save()
        switch save {
        case .success(_):
            print("🔗 File Saved Successfully 🔗")
            return
        case .failure(let failure):
            printError(failure)
            return
        }
        func printError(_ error: Error) {
            print("⛔️ - Error - ⛔️")
            print("⛔️ \(error) ⛔️")
        }
    }
    
}
extension String {
    var capitalFirst: String {
        guard let firstLetter = self.first else { return self }
        return firstLetter.uppercased() + self.dropFirst()
    }
}
