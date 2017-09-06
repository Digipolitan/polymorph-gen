//
//  Dir.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import Foundation

public struct Dir {

    private init() { }

    public static func mkdirTmp(path: String) throws -> String {
        let childPath = "\(path)-\(Date().timeIntervalSince1970)"
        try FileManager.default.createDirectory(atPath: childPath, withIntermediateDirectories: true, attributes: nil)
        return childPath
    }

    public static func cd(parent: String, children: [String]) -> String {
        return "\(parent)\(children.map { "/\($0)" })"
    }
}
