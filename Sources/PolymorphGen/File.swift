//
//  File.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import Foundation

public struct File {
    public let path: String
    public let name: String
    public let data: Data?

    public init(path: String, name: String, data: Data? = nil) {
        self.path = path
        self.name = name
        self.data = data
    }
}

extension File {

    @discardableResult
    public func write() -> Bool {
        return FileManager.default.createFile(atPath: "\(self.path)/\(self.name)", contents: self.data, attributes: nil)
    }   
}
