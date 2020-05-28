// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftCoroutine",
    products: [
        .library(
            name: "SwiftCoroutine",
            type: .dynamic,
            targets: ["CCoroutine", "SwiftCoroutine"])],
    targets: [
        .target(
            name: "CCoroutine",
            path: "Sources/CCoroutine"),
        .target(
            name: "SwiftCoroutine",
            dependencies: ["CCoroutine"],
            path: "Sources/SwiftCoroutine"),
        .testTarget(
            name: "SwiftCoroutineTests",
            dependencies: ["SwiftCoroutine"])]
)
