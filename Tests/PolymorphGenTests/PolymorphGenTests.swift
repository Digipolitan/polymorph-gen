import XCTest
@testable import PolymorphGen
import PolymorphCore

class PolymorphGenTests: XCTestCase {
    func testEmptyGen() {
        guard let package = try? Package(string: "com.sample.test") else {
            XCTFail("Cannot create package")
            return
        }
        let project = Project(name: "Sample", package: package)
        let gen = PolymorphGen()
        guard ((try? gen.generate(project, options: .init(path: "output"))) != nil) else {
            XCTFail("Cannot generate an empty project")
            return
        }
    }

    static var allTests = [
        ("testEmptyGen", testEmptyGen),
    ]
}

