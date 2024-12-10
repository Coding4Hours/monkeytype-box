// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MonkeytypeBox",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(name: "Monkeytype", targets: ["Monkeytype"]),
        .executable(name: "MonkeytypeBox", targets: ["MonkeytypeBox"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"),
    ],
    targets: [
        .target(name: "Monkeytype"),
        .executableTarget(name: "MonkeytypeBox", dependencies: [
            .byName(name: "Monkeytype"),
            .product(name: "ArgumentParser", package: "swift-argument-parser")
        ]),
    ]
)
