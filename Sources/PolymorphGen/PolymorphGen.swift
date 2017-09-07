//
//  PolymorphGen.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import PolymorphCore

public struct PolymorphGen {

    public struct Options {
        public let path: String
        public init(path: String) {
            self.path = path
        }
    }

    public var generators: [PlatformGen]

    public init(generators: [PlatformGen] = []) {
        self.generators = generators
    }

    public func generate(_ project: Project, options: Options) throws {
        let childPath = try Dir.mkdirTmp(path: options.path)
        for generator in self.generators {
            let files = try generator.generate(project, options: Options(path: Dir.cd(parent: childPath, children: [generator.name])))
            files.forEach({ $0.write() })
        }
    }
}
