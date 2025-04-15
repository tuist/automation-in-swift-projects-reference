#!/usr/bin/env -S deno run --allow-run --allow-read

const command = new Deno.Command("/usr/bin/xcrun", {
  args: [
    "xcodebuild",
    "-project",
    "Automation/Automation.xcodeproj",
    "-scheme",
    "Automation",
    "-destination",
    "generic/platform=iOS",
    "CODE_SIGNING_ALLOWED=NO",
    "CODE_SIGNING_REQUIRED=NO",
    "CODE_SIGN_IDENTITY=",
  ],
  cwd: new URL(".", import.meta.url).pathname,
  stdout: "inherit",
  stderr: "inherit",
});

const child = command.spawn();
const status = await child.status;
Deno.exit(status.code);
