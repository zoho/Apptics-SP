// swift-tools-version:5.3
import PackageDescription

let version = "2.0.501"
let package = Package(
    name: "Apptics",
    defaultLocalization: "en",
    platforms: [.macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)],
    products: [
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
        ),
        .library(
            name: "AppticsExtension",
            targets: ["AppticsExtension"]
        ),
        .library(
            name: "AppticsAnalytics",
            targets: ["AppticsAnalytics"]
        ),
        .library(
            name: "AppticsCrossPromotion",
            targets: ["AppticsCrossPromotion"]
        ),
        .library(
            name: "AppticsFeedbackKitSwift",
            targets: ["AppticsFeedbackKitSwift"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "JWT",
            path: "JWT.xcframework"
        ),
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
        ),
        .target(
            name: "AppticsExtension",
            path: "SwiftFiles/AppExtension",
            resources: [
                .copy("PrivacyInfo.xcprivacy")]
        ),
        .target(
            name: "AppticsAnalytics",
            dependencies: ["Apptics", "JWT", "AppticsEventTracker", "AppticsScreenTracker"], path: "SwiftFiles/Analytics"
        ),
        .target(
            name: "AppticsCrossPromotion",
            dependencies: ["AppticsAnalytics"],
            path: "SwiftFiles/CrossPromoApps",
            resources: [
                .copy("PrivacyInfo.xcprivacy")]
        ),
        .target(
            name: "AppticsFeedbackKitSwift",
            dependencies: ["AppticsFeedbackKit"],
            path: "SwiftFiles/AppticsFeedbackKit",
            resources: [
                .copy("PrivacyInfo.xcprivacy")]
        )
    ]
)
