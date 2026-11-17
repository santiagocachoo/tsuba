// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "TsubaKit",
    platforms: [
        .macOS("27.0"),
        .iOS("27.0"),
    ],
    products: [
        .library(name: "TsubaKit", targets: ["TsubaKit"])
    ],
    targets: [
        // Core: Foundation only. No AppKit, UIKit, SwiftUI or MIDIKit.
        .target(name: "TsubaKit"),
        .testTarget(name: "TsubaKitTests", dependencies: ["TsubaKit"]),
    ],
    swiftLanguageModes: [.v6]
)
