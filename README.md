PolymorphGen
=================================

[![Swift Package Manager](https://rawgit.com/jlyonsmith/artwork/master/SwiftPackageManager/swiftpackagemanager-compatible.svg)](https://swift.org/package-manager/)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

Base library to generate files, part of the [Polymorph](https://github.com/Digipolitan/polymorph-cli) project

## Installation

### SPM

To install PolymorphGen with SwiftPackageManager, add the following lines to your `Package.swift`.

```swift
let package = Package(
    name: "XXX",
    products: [
        .library(
            name: "XXX",
            targets: ["XXX"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Digipolitan/polymorph-gen.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "XXX",
            dependencies: ["PolymorphGen"])
    ]
)
```

## The Basics

All child platform must implements the PlatformGen interface and override all fields & methods

```swift
class ExampleGen: PlatformGen {
    static var name: String {
        return "Example"
    }
    static var shared: PlatformGen = ExampleGen()

    private init() { }

    func generate(_ project: Project, options: PolymorphGen.Options) throws -> [File] {
        // TODO
    }
}
```

After that register your platform when initializing the PolymorphGen instance

```swift
let generator = PolymorphGen(platforms: [
    ExampleGen.self
])
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

PolymorphGen is licensed under the [BSD 3-Clause license](LICENSE).
