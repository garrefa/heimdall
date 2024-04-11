// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Heimdall",
    products: [
        .library(
            name: "Heimdall",
            targets: ["Heimdall"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Heimdall",
            dependencies: []),
        .testTarget(
            name: "HeimdallTests",
            dependencies: ["Heimdall"]),
    ]
)
