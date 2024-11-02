// swift-tools-version: 5.10

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "About Package",
    platforms: [
        .macOS("14.0"),
        .iOS("17.0"),
        .tvOS("17.0"),
        .watchOS("10.0"),
        .macCatalyst("17.0")
    ],
    products: [
        .library(
            name: "About",
            targets: ["About"]
        ),
        .iOSApplication(
            name: "About Package",
            targets: ["About_App"],
            bundleIdentifier: "James.About",
            teamIdentifier: "VKFDYMU9HJ",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .leaf),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .target(
            name: "About",
            path: "About"
        ),
        .executableTarget(
            name: "About_App",
            dependencies: [
                "About"
            ],
            path: "About_App"
        )
    ],
    swiftLanguageVersions: [.v5]
)