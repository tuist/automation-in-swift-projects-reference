# Automate your Swift projects (reference)

This repository is a companion repository for [this blog post](https://tuist.dev/blog/2025/04/15/automation-in-swift-projects) including examples of how to automate your Swift projects.

It contains a Xcode project and various automation approaches, all of them building the project.

## Usage

1. Clone the repository: `git clone git@github.com:tuist/automation-in-swift-projects-reference.git`.
2. Install dependencies: `mise install`.

You can then try the different automation approaches to build the project:

- `fastlane build`: Runs the `build` lane in [`./fastlane/Fastfile`](./fastlane/Fastfile), which internally uses [Fastlane's gym](https://docs.fastlane.tools/actions/gym/)
- `sake run build`: Runs the `build` workflow in [`./SakeApp/Sakefile.swift`](./SakeApp/Sakefile.swift).
- `build.swift`: Runs the [`build.swift`](./build.swift) Swift script.
- `build.sh`: Runs the [`build.bash`](./build.bash) Swift script.
- `build.js`: Runs the [`build.js`](./build.js) JS script in Deno.
