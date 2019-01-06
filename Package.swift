// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PolymorphGen",
    products: [
        .library(
            name: "PolymorphGen",
            targets: ["PolymorphGen"])
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/polymorph-core.git", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "PolymorphGen",
            dependencies: ["PolymorphCore"]),
        .testTarget(
            name: "PolymorphGenTests",
            dependencies: ["PolymorphGen"])
    ]
)
