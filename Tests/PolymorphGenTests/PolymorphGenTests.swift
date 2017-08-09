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

    func testCodeBuilderWithTabs() {
        let builder = CodeBuilder()
        builder.add(line: "if test {").rightTab().add(line: "print(\"ok\")").leftTab().add(line: "}")
        let res = builder.build()
        XCTAssertEqual(res, "if test {\n\tprint(\"ok\")\n}\n")
    }

    func testCodeBuilderWithInnerCodeBuilder() {
        let other = CodeBuilder()
        other.add(line: "if test {").rightTab().add(line: "print(\"ok\")").leftTab().add(line: "}")

        let builder = CodeBuilder()
        builder.add(line: "if polymorph {").rightTab().add(code: other).leftTab().add(line: "}")

        let res = builder.build()
        XCTAssertEqual(res, "if polymorph {\n\tif test {\n\t\tprint(\"ok\")\n\t}\n}\n")
    }

    static var allTests = [
        ("testEmptyGen", testEmptyGen),
        ("testCodeBuilderWithTabs", testCodeBuilderWithTabs),
        ("testCodeBuilderWithInnerCodeBuilder", testCodeBuilderWithInnerCodeBuilder)
    ]
}

