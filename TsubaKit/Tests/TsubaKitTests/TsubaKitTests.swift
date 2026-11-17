import Testing

@testable import TsubaKit

@Suite("TsubaKit")
struct TsubaKitTests {
    @Test("Version is a semantic version")
    func versionIsSemantic() {
        let parts = TsubaKit.version.split(separator: ".")
        #expect(parts.count == 3)
        #expect(parts.allSatisfy { Int($0) != nil })
    }
}
