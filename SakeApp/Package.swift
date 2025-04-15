// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "SakeApp",
    platforms: [.macOS(.v13)],  // Required by SwiftSyntax for the macro feature in Sake
    products: [
        .executable(name: "SakeApp", targets: ["SakeApp"])
    ],
    dependencies: [
        .package(url: "https://github.com/kattouf/Sake", from: "0.1.0"),
        .package(url: "https://github.com/tuist/command", from: "0.13.0"),
        .package(url: "https://github.com/tuist/path", from: "0.3.8")
    ],
    targets: [
        .executableTarget(
            name: "SakeApp",
            dependencies: [
                "Sake",
                .product(name: "Command", package: "command"),
                .product(name: "Path", package: "path")
            ],
            path: "."
        )
    ]
)
