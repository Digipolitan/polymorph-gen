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

    public var platforms: [PlatformGen.Type]

    public init(platforms: [PlatformGen.Type] = []) {
        self.platforms = platforms
    }

    public func generate(_ project: Project, options: Options) throws {
        let childPath = try Dir.mkdirTmp(path: options.path)
        for platform in self.platforms {
            let files = try platform.shared.generate(project, options: Options(path: Dir.cd(parent: childPath, children: [platform.name])))
            files.forEach({ $0.write() })
        }
    }
}
