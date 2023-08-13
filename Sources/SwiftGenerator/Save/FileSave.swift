//
//  File.swift
//  
//
//  Created by Apple on 06/08/2023.
//

import Foundation
import core_architecture



struct FileData: Savable {
    var shouldReplace: Bool
    var url: URL
    var data: Data
    init?(url: URL, data: Data?, shouldReplace: Bool) {
        guard url.isLocalURL else {return nil}
        guard let data else { return nil }
        self.data = data
        self.url = url
        self.shouldReplace = shouldReplace
    }
}

class FileSaver<DATA: Savable>: FileSaving {
    typealias Inupt = DATA
    private var input: Input
    init(input: Input) {
        self.input = input
    }
    private var isFileAvailable: Bool {
        return FileManager.default.fileExists(atPath: input.url.filePath)
    }
    private var isDeletable: Bool {
        FileManager.default.isDeletableFile(atPath: input.url.filePath)
    }
    
    private func createFile() {
        FileManager.default.createFile(atPath: input.url.filePath, contents: input.data)
    }
    
    private func deleteFile() throws {
        try FileManager.default.removeItem(at: input.url)
    }
    
    func save() async -> Result<Bool, LocalFileErrorCode> {
        do {
            if isFileAvailable {
                if input.shouldReplace {
                    try deleteFile()
                    createFile()
                }else {
                    try input.data.write(to: input.url)
                }
            }
            else {
                createFile()
            }
            return .success(true)
        }
        catch _ {
            // TODO: Send Custom Error inside Failure
            return Output.failure(.fileNotFound)
        }
    }
}
