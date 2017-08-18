//
//  PlatformGen.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import Foundation
import PolymorphCore

open class PlatformGen {

    public struct Options {
        public let path: String
        public init(path: String) {
            self.path = path
        }
    }

    public init() { }

    public func generate(_ project: Project, options: Options) throws -> [File] {
        var files: [File] = []
        files.append(contentsOf: try self.models(project.models, options: options))
        return files
    }

    open func models(_ models: Models, options: Options) throws -> [File] {
        return []
    }
}
