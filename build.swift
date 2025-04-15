#!/usr/bin/swift sh

import Command  // tuist/command ~> 0.13.0
import Foundation
import Path  // tuist/path ~> 0.3.8

if CommandLine.arguments.count == 2 {
    let projectPath = try AbsolutePath(
        validating: CommandLine.arguments[1],
        relativeTo: try AbsolutePath(validating: FileManager.default.currentDirectoryPath))

    try await CommandRunner().run(arguments: [
        "/usr/bin/xcrun", "xcodebuild",
        "-project",
        projectPath.pathString,
        "-scheme", "Automation",
        "-destination", "generic/platform=iOS",
        "CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY=''",
    ]).pipedStream().awaitCompletion()
} else {
    print("Usage: ./build.swift path/to/project.xcodeproj")
    exit(1)
}
