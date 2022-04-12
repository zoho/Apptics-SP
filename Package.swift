// swift-tools-version:5.3
import PackageDescription

let version = "1.0.3"
let package = Package(
    name: "Apptics",
    defaultLocalization: "en",
    platforms: [.macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(
            name: "Apptics",
            targets: ["Apptics"]
        ),
        .library(
            name: "AppticsEventTracker",
            targets: ["AppticsEventTracker"]
        ),
        .library(
            name: "AppticsScreenTracker",
            targets: ["AppticsScreenTracker"]
        ),
        .library(
            name: "AppticsCrashKit",
            targets: ["AppticsCrashKit"]
        ),
        .library(
            name: "AppticsFeedbackKit",
            targets: ["AppticsFeedbackKit"]
        ),
        .library(
            name: "AppticsInAppUpdate",
            targets: ["AppticsInAppUpdate"]
        ),
        .library(
            name: "AppticsRateUs",
            targets: ["AppticsRateUs"]
        ),
        .library(
            name: "AppticsRemoteConfig",
            targets: ["AppticsRemoteConfig"]
        ),
        .library(
            name: "AppticsApiTracker",
            targets: ["AppticsApiTracker"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Apptics",
            path: "Apptics.xcframework"
        ),
        .binaryTarget(
            name: "AppticsEventTracker",
            path: "AppticsEventTracker.xcframework"
        ),
        .binaryTarget(
            name: "AppticsScreenTracker",
            path: "AppticsScreenTracker.xcframework"
        ),
        .binaryTarget(
            name: "AppticsCrashKit",
            path: "AppticsCrashKit.xcframework"
        ),
        .binaryTarget(
            name: "AppticsFeedbackKit",
            path: "AppticsFeedbackKit.xcframework"
        ),
        .binaryTarget(
            name: "AppticsInAppUpdate",
            path: "AppticsInAppUpdate.xcframework"
        ),
        .binaryTarget(
            name: "AppticsRateUs",
            path: "AppticsRateUs.xcframework"
        ),
        .binaryTarget(
            name: "AppticsRemoteConfig",
            path: "AppticsRemoteConfig.xcframework"
        ),
        .binaryTarget(
            name: "AppticsApiTracker",
            path: "AppticsApiTracker.xcframework"
        )
    ]
)
