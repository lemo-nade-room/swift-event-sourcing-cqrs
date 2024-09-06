// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "event-sourcing-cqrs",
    platforms: [.macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "EventProducer",
            targets: ["EventProducer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing.git", from: "0.10.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "EventProducer"),
        .testTarget(
            name: "EventProducerTests",
            dependencies: [
                "EventProducer",
                .product(name: "Testing", package: "swift-testing"),
            ]),
    ]
)
