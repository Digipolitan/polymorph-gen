//
//  PlatformGen.swift
//  PolymorphGen
//
//  Created by Benoit BRIATTE on 09/08/2017.
//

import Foundation
import PolymorphCore

public protocol PlatformGen {
    static var name: String { get }
    static var shared: PlatformGen { get }
    func generate(_ project: Project, options: PolymorphGen.Options) throws -> [File]
}
