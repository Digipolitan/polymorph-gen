//
//  EnumFileBuilder.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 23/10/2017.
//

import Foundation
import PolymorphCore

public protocol EnumFileBuilder {
    func build(element: Enum, options: PolymorphGen.Options) throws -> [File]
}

open class EnumFileBuilderArray: EnumFileBuilder {

    private var children: [EnumFileBuilder]

    public init(children: [EnumFileBuilder]) {
        self.children = children
    }

    public func build(element: Enum, options: PolymorphGen.Options) throws -> [File] {
        return try self.children.map { try $0.build(element: element, options: options) }.reduce([], { return $0 + $1 })
    }
}

