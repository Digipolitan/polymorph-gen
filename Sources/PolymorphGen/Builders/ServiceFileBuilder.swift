//
//  ServiceFileBuilder.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 23/10/2017.
//

import Foundation
import PolymorphCore

public protocol ServiceFileBuilder {
    func build(element: Service, options: PolymorphGen.Options) throws -> [File]
}

open class ServiceFileBuilderArray: ServiceFileBuilder {

    private var children: [ServiceFileBuilder]

    public init(children: [ServiceFileBuilder]) {
        self.children = children
    }

    public func build(element: Service, options: PolymorphGen.Options) throws -> [File] {
        return try self.children.map { try $0.build(element: element, options: options) }.reduce([], { return $0 + $1 })
    }
}
