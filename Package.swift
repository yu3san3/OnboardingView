// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "OnboardingView",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "OnboardingView",
            targets: ["OnboardingView"]
        ),
    ],
    targets: [
        .target(
            name: "OnboardingView"
        ),
        .testTarget(
            name: "OnboardingViewTests",
            dependencies: ["OnboardingView"]
        ),
    ]
)
