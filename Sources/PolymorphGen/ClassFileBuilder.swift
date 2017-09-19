//
//  ClassFileBuilder.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 19/09/2017.
//

import Foundation
import PolymorphCore

public protocol ClassFileBuilder {
    func build(element: Class, options: PolymorphGen.Options) throws -> [File]
}

open class ClassFileBuilderArray: ClassFileBuilder {

    private var children: [ClassFileBuilder] = []

    public init(children: [ClassFileBuilder]) {
        self.children = children
    }

    public func build(element: Class, options: PolymorphGen.Options) throws -> [File] {
        return try self.children.map { try $0.build(element: element, options: options) }.reduce([], { return $0 + $1 })
    }
}
