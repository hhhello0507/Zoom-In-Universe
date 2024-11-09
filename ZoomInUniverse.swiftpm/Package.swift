// swift-tools-version: 6.0

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "ZoomInUniverse",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "ZoomInUniverse",
            targets: ["AppModule"],
            bundleIdentifier: "com.hhhello0507.ZoomInUniverse",
            teamIdentifier: "B42SPPS3PR",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .earth),
            accentColor: .presetColor(.pink),
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
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ],
    swiftLanguageVersions: [.v6]
)