// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "event-sourcing-cqrs",
    platforms: [.macOS(.v14)],
    products: [
        .library(
            name: "EventProducer",
            targets: ["EventProducer"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.10.0"),
        .package(url: "https://github.com/realm/SwiftLint.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "EventProducer",
            plugins: swiftLintPlugins
        ),
        .testTarget(
            name: "EventProducerTests",
            dependencies: [
                "EventProducer",
                .product(name: "Testing", package: "swift-testing"),
            ],
            plugins: swiftLintPlugins
        ),
    ]
)
var swiftLintPlugins: [Target.PluginUsage] {
    guard Environment.enableSwiftLint else { return [] }
    return [
        .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLint")
    ]
}

enum Environment {
    static func get(_ key: String) -> String? {
        ProcessInfo.processInfo.environment[key]
    }
    static var enableSwiftLint: Bool {
        Self.get("SWIFTLINT") == "true"
    }
}
