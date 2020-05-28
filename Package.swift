// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
        name: "SwiftCoroutine",
        products: [
            .library(
                    name: "SwiftCoroutine",
                    type: .dynamic,
                    targets: ["CCoroutine", "SwiftCoroutine"])
        ],
        dependencies: [
            .package(url: "https://github.com/broadwaylamb/OpenCombine.git", from: "0.8.0")
        ],
        targets: [
            .target(
                    name: "CCoroutine",
                    path: "Sources/CCoroutine"),
            .target(
                    name: "SwiftCoroutine",
                    dependencies: [
                        "CCoroutine",
                        "OpenCombine",
                        "OpenCombineDispatch",
                        "OpenCombineFoundation"
                    ],
                    path: "Sources/SwiftCoroutine"),
            .testTarget(
                    name: "SwiftCoroutineTests",
                    dependencies: ["SwiftCoroutine"])]
)
