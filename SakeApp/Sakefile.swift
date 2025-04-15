import Foundation
import Sake
import Command
import Path

@main
@CommandGroup
struct Commands: SakeApp {
    public static var build: Sake.Command {
        Command(
            run: { _ in
                let sakefilePath = try AbsolutePath(validating: #file, relativeTo: try AbsolutePath(validating: FileManager.default.currentDirectoryPath))
                let rootDirectory = sakefilePath.parentDirectory.parentDirectory
                try await CommandRunner().run(arguments: [
                    "/usr/bin/xcrun", "xcodebuild",
                    "-project", rootDirectory.appending(components: ["Automation", "Automation.xcodeproj"]).pathString,
                    "-scheme", "Automation",
                    "-destination", "generic/platform=iOS",
                    "CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO CODE_SIGN_IDENTITY=''"
                ]).pipedStream().awaitCompletion()
            }
        )
    }
}
