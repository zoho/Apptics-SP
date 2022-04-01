// swift-tools-version:5.3
import PackageDescription

let version = "1.0.3"
let package = Package(
    name: "Apptics",
    defaultLocalization: "en",
    platforms: [.macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)],
    products: [
        .library(
            name: "AppticsAnalytics",
            targets: ["AppticsAnalyticsTarget"]
        ),
        .library(
            name: "AppticsEventTracker",
            targets: ["AppticsEventTrackerTarget"]
        ),
        .library(
            name: "AppticsScreenTracker",
            targets: ["AppticsScreenTrackerTarget"]
        ),
        .library(
            name: "AppticsCrashKit",
            targets: ["AppticsCrashKitTarget"]
        ),
        .library(
            name: "AppticsFeedbackKit",
            targets: ["AppticsFeedbackKitTarget"]
        ),
        .library(
            name: "AppticsInAppUpdate",
            targets: ["AppticsInAppUpdateTarget"]
        ),
        .library(
            name: "AppticsRateUs",
            targets: ["AppticsRateUsTarget"]
        ),
        .library(
            name: "AppticsRemoteConfig",
            targets: ["AppticsRemoteConfigTarget"]
        ),
        .library(
            name: "AppticsApiTracker",
            targets: ["AppticsApiTrackerTarget"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "AppticsAnalyticsTarget",
            path: "Apptics.xcframework"
        ),
        .binaryTarget(
            name: "AppticsEventTrackerTarget",
            path: "AppticsEventTracker.xcframework"
        ),
        .binaryTarget(
            name: "AppticsScreenTrackerTarget",
            path: "AppticsScreenTracker.xcframework"
        ),
        .binaryTarget(
            name: "AppticsCrashKitTarget",
            path: "AppticsCrashKit.xcframework"
        ),
        .binaryTarget(
            name: "AppticsFeedbackKitTarget",
            path: "AppticsFeedbackKit.xcframework"
        ),
        .binaryTarget(
            name: "AppticsInAppUpdateTarget",
            path: "AppticsInAppUpdate.xcframework"
        ),
        .binaryTarget(
            name: "AppticsRateUsTarget",
            path: "AppticsRateUs.xcframework"
        ),
        .binaryTarget(
            name: "AppticsRemoteConfigTarget",
            path: "AppticsRemoteConfig.xcframework"
        ),
        .binaryTarget(
            name: "AppticsApiTrackerTarget",
            path: "AppticsApiTracker.xcframework"
        )
    ]
)

